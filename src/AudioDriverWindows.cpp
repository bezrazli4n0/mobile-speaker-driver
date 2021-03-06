#ifdef _WIN32

#pragma comment(lib, "Winmm")
#pragma comment(lib, "Ws2_32")
#pragma comment(lib, "Avrt")

#define _WINSOCKAPI_

#include "../include/msd/AudioDriverWindows.h"
#include <mmdeviceapi.h>
#include <audioclient.h>
#include <WinSock2.h>
#include <ws2tcpip.h>
#include <Windows.h>
#include <avrt.h>
#include <stdexcept>

namespace msd {
    class AudioDriverWindows::impl {
    public:
        IAudioClient* pAudioClient{};
        IMMDevice* pMMDevice{};
        IAudioCaptureClient* pAudioCaptureClient{};
        WAVEFORMATEX* pwfx{};

        void createAudioClient();
        void getDeviceMixFormat();
        void convertFormatToPcm16();
        void initAudioClient();
        void createAudioCaptureClient();
        void startAudioClient();

        void freeInterface();
        ~impl();
    };

    AudioDriverWindows::AudioDriverWindows(Connectable* connectable) {
        pImpl = new impl{};
        this->connectable = connectable;

        auto hr = CoInitialize(nullptr);
        if (FAILED(hr))
            throw new std::runtime_error{ "COM libary is not initialized" };
    }

    AudioDriverWindows::~AudioDriverWindows() {
        delete pImpl;
    }

    void AudioDriverWindows::impl::createAudioClient() {
        if (FAILED(pMMDevice->Activate(__uuidof(IAudioClient), CLSCTX_ALL, nullptr, reinterpret_cast<void**>(&pAudioClient))))
            throw new std::runtime_error{ "Audio client activation failure" };
    }

    void AudioDriverWindows::impl::getDeviceMixFormat() {
        if (FAILED(pAudioClient->GetMixFormat(&pwfx)))
            throw new std::runtime_error{ "Device format not found" };
    }

    void AudioDriverWindows::impl::convertFormatToPcm16() {
        switch (pwfx->wFormatTag) {
            case WAVE_FORMAT_IEEE_FLOAT:
            {
                pwfx->wFormatTag = WAVE_FORMAT_PCM;
                pwfx->wBitsPerSample = 16;
                pwfx->nBlockAlign = pwfx->nChannels * pwfx->wBitsPerSample / 8;
                pwfx->nAvgBytesPerSec = pwfx->nBlockAlign * pwfx->nSamplesPerSec;
            }
            break;

            case WAVE_FORMAT_EXTENSIBLE:
            {
                PWAVEFORMATEXTENSIBLE pEx = reinterpret_cast<PWAVEFORMATEXTENSIBLE>(pwfx);
                if (IsEqualGUID(KSDATAFORMAT_SUBTYPE_IEEE_FLOAT, pEx->SubFormat)) {
                    pEx->SubFormat = KSDATAFORMAT_SUBTYPE_PCM;
                    pEx->Samples.wValidBitsPerSample = 16;
                    pwfx->wBitsPerSample = 16;
                    pwfx->nBlockAlign = pwfx->nChannels * pwfx->wBitsPerSample / 8;
                    pwfx->nAvgBytesPerSec = pwfx->nBlockAlign * pwfx->nSamplesPerSec;
                }
                else
                    throw new std::runtime_error{ "Don't know how to convert to pcm 16 format" };
            }
            break;

            default:
                throw new std::runtime_error{ "Don't know how to coerce waveformat" };
        }
    }

    void AudioDriverWindows::impl::initAudioClient() {
        if (FAILED(pAudioClient->Initialize(AUDCLNT_SHAREMODE_SHARED, AUDCLNT_STREAMFLAGS_LOOPBACK, 0, 0, pwfx, 0)))
            throw new std::runtime_error{ "Audio client initialization error" };
    }

    void AudioDriverWindows::impl::createAudioCaptureClient() {
        if (FAILED(pAudioClient->GetService(__uuidof(IAudioCaptureClient), reinterpret_cast<void**>(&pAudioCaptureClient))))
            throw new std::runtime_error{ "Audio capture client initialization error" };
    }

    void AudioDriverWindows::impl::startAudioClient() {
        if (FAILED(pAudioClient->Start()))
            throw new std::runtime_error{ "Audio client is not started" };
    }

    AudioDriverWindows::impl::~impl() {
        freeInterface();
    }

    void AudioDriverWindows::impl::freeInterface() {
        if (pAudioClient != nullptr) {
            pAudioClient->Release();
            pAudioClient = nullptr;
        }

        if (pMMDevice != nullptr) {
            pMMDevice->Release();
            pMMDevice = nullptr;
        }

        if (pAudioCaptureClient != nullptr) {
            pAudioCaptureClient->Release();
            pAudioCaptureClient = nullptr;
        }
    }

    void AudioDriverWindows::init() {
        IMMDeviceEnumerator* pMMDeviceEnumerator{};

        HRESULT hr = CoCreateInstance(__uuidof(MMDeviceEnumerator), nullptr, CLSCTX_ALL, __uuidof(IMMDeviceEnumerator), reinterpret_cast<void**>(&pMMDeviceEnumerator));
        if (FAILED(hr))
            throw new std::runtime_error{ "Device enumerator initialization error" };

        hr = pMMDeviceEnumerator->GetDefaultAudioEndpoint(eRender, eConsole, &pImpl->pMMDevice);
        if (FAILED(hr))
            throw new std::runtime_error{ "Default audio endpoint exception" };
    }

    void AudioDriverWindows::audioLoopback() {
        pImpl->startAudioClient();
    
        bool bDone = false;
        bool bFirstPacket = true;

        for (UINT32 nPasses = 0; !bDone; nPasses++) {
            UINT32 nNextPacketSize{};
            for (HRESULT hr = pImpl->pAudioCaptureClient->GetNextPacketSize(&nNextPacketSize); SUCCEEDED(hr) && nNextPacketSize > 0; hr = pImpl->pAudioCaptureClient->GetNextPacketSize(&nNextPacketSize)) {
                BYTE* pData{};
                UINT32 nNumFramesToRead{};
                DWORD dwFlags{};

                if (FAILED(pImpl->pAudioCaptureClient->GetBuffer(&pData, &nNumFramesToRead, &dwFlags, nullptr, nullptr)))
                    throw new std::runtime_error{ "Can't get audio capture buffer" };

                if (connectable != nullptr)
                    connectable->sendData(pData, nNumFramesToRead * pImpl->pwfx->nBlockAlign);

                if (FAILED(pImpl->pAudioCaptureClient->ReleaseBuffer(nNumFramesToRead)))
                    throw new std::runtime_error{ "Can't release audio capture buffer" };

                bFirstPacket = false;
            }
        }
    }

    std::pair<unsigned int, unsigned int> AudioDriverWindows::getRates() {
        init();
        pImpl->createAudioClient();
        pImpl->getDeviceMixFormat();
        auto samples = pImpl->pwfx->nSamplesPerSec;
        auto channels = pImpl->pwfx->nChannels;
        pImpl->freeInterface();
        return { samples, channels };
    }

    void AudioDriverWindows::initAvrt() {
        DWORD nTaskIndex{};
        HANDLE hTask = AvSetMmThreadCharacteristicsW(L"Audio", &nTaskIndex);
        if (hTask == nullptr)
            throw new std::runtime_error{ "Avrt initialization error" };
    }

    void AudioDriverWindows::initDriver() {
        try {
            init();
            pImpl->createAudioClient();
            pImpl->getDeviceMixFormat();
            pImpl->convertFormatToPcm16();
            pImpl->initAudioClient();
            pImpl->createAudioCaptureClient();
            initAvrt();
            audioLoopback();
        }
        catch (const std::runtime_error* ex) {
            throw new std::runtime_error{ "Critical error on driver initialization" };
        }
    }

    void AudioDriverWindows::freeDriver() {
        pImpl->freeInterface();
    }
}

#endif