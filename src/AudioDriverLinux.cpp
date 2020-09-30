#ifdef __linux__

#include "../include/msd/AudioDriverLinux.h"
#include <stdexcept>
#include <alsa/asoundlib.h>
#include <string>

namespace msd {
    class AudioDriverLinux::impl {
    private:
        const unsigned int rate = 44100;
        const unsigned int channels = 2;
        const unsigned int periodSize = 1024;
        const unsigned int periodTime = 0;
        const unsigned int framesTime = periodTime;
        snd_pcm_uframes_t frames{};

        unsigned int actualSampleRate{};
        unsigned int actualPeriodTime{};
        unsigned int actualChannels{};

        snd_pcm_t* captureHandle{};
        snd_pcm_hw_params_t* hwParams{};
        const std::string device = "hw:Loopback,1";

        unsigned int* buffer{};
        unsigned int bufferSize{};
    public:
        impl();
        ~impl();
        
        void openDevice();
        void configureDevice();
        void getActualRates();
        void prepareDevice();
        void audioLoopback(Connectable* connectable);

        void freeInterface();
    };

    AudioDriverLinux::impl::impl() {
    }

    AudioDriverLinux::impl::~impl() {
        freeInterface();
    }

    void AudioDriverLinux::impl::freeInterface() {
        actualSampleRate = actualPeriodTime = actualChannels = 0;

        if (buffer != nullptr) {
            delete[] buffer;
            buffer = nullptr;
        }

        if (hwParams != nullptr) {
            snd_pcm_hw_params_free(hwParams);
            hwParams = nullptr;
        }

        if (captureHandle != nullptr) {
            snd_pcm_drain(captureHandle);
            snd_pcm_close(captureHandle);
            captureHandle = nullptr;
        }
    }

    void AudioDriverLinux::impl::openDevice() {
        if (snd_pcm_open(&captureHandle, device.c_str(), SND_PCM_STREAM_CAPTURE, 0) < 0)
            throw new std::runtime_error{ "Can't open device for capture" };
    }

    void AudioDriverLinux::impl::configureDevice() {
        if (snd_pcm_hw_params_malloc(&hwParams) < 0)
            throw new std::runtime_error{ "Can't allocate hw parameters structure" };

        if (snd_pcm_hw_params_any(captureHandle, hwParams) < 0)
            throw new std::runtime_error{ "Can't initialize parameters structure" };

        if (snd_pcm_hw_params_set_access(captureHandle, hwParams, SND_PCM_ACCESS_RW_INTERLEAVED) < 0)
            throw new std::runtime_error{ "Can't set access parameter" };

        if (snd_pcm_hw_params_set_format(captureHandle, hwParams, SND_PCM_FORMAT_S16_LE) < 0)
            throw new std::runtime_error{ "Can't set format parameter" };

        if (snd_pcm_hw_params_set_rate_near(captureHandle, hwParams, const_cast<unsigned int*>(&rate), 0) < 0)
            throw new std::runtime_error{ "Can't set rate" };

        frames = periodSize;
        if (snd_pcm_hw_params_set_period_size_near(captureHandle, hwParams, &frames, 0) < 0)
            throw new std::runtime_error{ "Can't set period" };

        if (snd_pcm_hw_params_set_period_time_near(captureHandle, hwParams, const_cast<unsigned int*>(&framesTime), 0) < 0)
            throw new std::runtime_error{ "Can't set period time" };

        if (snd_pcm_hw_params_set_channels(captureHandle, hwParams, channels) < 0)
            throw new std::runtime_error{ "Can't set channels count" };

        if (snd_pcm_hw_params(captureHandle, hwParams) < 0)
            throw new std::runtime_error{ "Can't set parameters" };
    }

    void AudioDriverLinux::impl::getActualRates() {
        snd_pcm_hw_params_get_rate(hwParams, &actualSampleRate, 0);

        snd_pcm_hw_params_get_period_size(hwParams, &frames, 0);

        snd_pcm_hw_params_get_period_time(hwParams, &actualPeriodTime, 0);

        snd_pcm_hw_params_get_channels(hwParams, &actualChannels);
    }

    void AudioDriverLinux::impl::prepareDevice() {
        snd_pcm_hw_params_free(hwParams);
        hwParams = nullptr;

        bufferSize = (frames * channels * snd_pcm_format_physical_width(SND_PCM_FORMAT_S16_LE)) / 8;

        if (snd_pcm_prepare(captureHandle) < 0)
            throw new std::runtime_error{ "Can't prepare capture device" };

        buffer = new unsigned int[bufferSize]{};
    }

    void AudioDriverLinux::impl::audioLoopback(Connectable* connectable) {
        while (true) {
            auto rc = snd_pcm_readi(captureHandle, buffer, frames);
            if (rc == -EPIPE)
                snd_pcm_prepare(captureHandle);
            else if (rc < 0)
                throw new std::runtime_error{ "Error while reading from device" };
            else if (rc != frames)
                throw new std::runtime_error{ "Error, readed frames must eq. to actual frames" };

            if (connectable != nullptr)
                connectable->sendData(buffer, bufferSize);
        }
    }

    AudioDriverLinux::AudioDriverLinux(Connectable* connectable) {
        this->connectable = connectable;
        pImpl = new impl{};
    }

    AudioDriverLinux::~AudioDriverLinux() {
        delete pImpl;
    }

    std::pair<unsigned int, unsigned int> AudioDriverLinux::getRates() {
        pImpl->openDevice();
        pImpl->configureDevice();
        pImpl->getActualRates();
        pImpl->freeInterface();
        return { actualSampleRate, actualChannels };
    }

    void AudioDriverLinux::initDriver() {
        try {
            pImpl->openDevice();
            pImpl->configureDevice();
            pImpl->getActualRates();
            pImpl->prepareDevice();
            pImpl->audioLoopback(connectable);
        }
        catch(const std::runtime_error* e) {
            throw new std::runtime_error{ "Critical error on driver initialization" };
        }
    }

    void AudioDriverLinux::freeDriver() {
        pImpl->freeInterface();
    }
}

#endif