#ifdef __linux__

#include "../include/msd/AudioDriverLinux.h"
#include <iostream>
#include <stdexcept>
#include <alsa/asoundlib.h>

namespace msd {
    AudioDriverLinux::AudioDriverLinux(Connectable* connectable) {
        this->connectable = connectable;
    }

    AudioDriverLinux::~AudioDriverLinux() {
    }

    void AudioDriverLinux::initDriver() {
        std::cout << "Linux driver loaded!" << std::endl;
        
        char* device = "default";
        unsigned int rate = 44100;
        unsigned int channels = 2;
        snd_pcm_uframes_t frames{};
        snd_pcm_t* capture_handle{};
        snd_pcm_hw_params_t* hw_params{};

        if (snd_pcm_open(&capture_handle, device, SND_PCM_STREAM_CAPTURE, 0) < 0)
            throw new std::runtime_error{ "Can't open device for capture" };

        if (snd_pcm_hw_params_malloc(&hw_params) < 0)
            throw new std::runtime_error{ "Can't allocate hw parameters structure" };

        if (snd_pcm_hw_params_any(capture_handle, hw_params) < 0)
            throw new std::runtime_error{ "Can't initialize parameters structure" };

        if (snd_pcm_hw_params_set_access(capture_handle, hw_params, SND_PCM_ACCESS_RW_INTERLEAVED) < 0)
            throw new std::runtime_error{ "Can't set access parameter" };

        if (snd_pcm_hw_params_set_format(capture_handle, hw_params, SND_PCM_FORMAT_S16_LE) < 0)
            throw new std::runtime_error{ "Can't set access parameter" };

        if (snd_pcm_hw_params_set_rate_near(capture_handle, hw_params, &rate, 0) < 0)
            throw new std::runtime_error{ "Can't set rate" };

        if (snd_pcm_hw_params_set_channels(capture_handle, hw_params, channels) < 0)
            throw new std::runtime_error{ "Can't set channels count" };

        frames = 32;
        if (snd_pcm_hw_params_set_period_size_near(capture_handle, hw_params, &frames, 0))
            throw new std::runtime_error{ "Can't set period size" };

        if (snd_pcm_hw_params(capture_handle, hw_params) < 0)
            throw new std::runtime_error{ "Can't set parameters" };

        snd_pcm_hw_params_free(hw_params);

        if (snd_pcm_prepare(capture_handle) < 0)
            throw new std::runtime_error{ "Can't prepare capture device" };

        if (snd_pcm_hw_params_get_period_size(hw_params, &frames, 0) < 0)
            throw new std::runtime_error{ "Can't get frames count" };

        const unsigned int bufSize = frames * channels * 2;
        unsigned int buf[bufSize];
        while (true) {
            if (snd_pcm_readi(capture_handle, &buf[0], bufSize) != bufSize)
                throw new std::runtime_error{ "Can't read from buffer" };
            
            if (connectable != nullptr)
                connectable->sendData(buf, bufSize);
        }

        snd_pcm_close(capture_handle);
    }

    void AudioDriverLinux::freeDriver() {
        std::cout << "Linux driver unloaded!" << std::endl;
    }
}

#endif