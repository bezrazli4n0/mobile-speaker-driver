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
        unsigned int rate = 48000;
        unsigned int channels = 2;
        unsigned int periodSize = 32;
        unsigned int periodTime = 0;
        unsigned int framesTime = periodTime;
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
            throw new std::runtime_error{ "Can't set format parameter" };

        if (snd_pcm_hw_params_set_rate_near(capture_handle, hw_params, &rate, 0) < 0)
            throw new std::runtime_error{ "Can't set rate" };

        frames = periodSize;
        if (snd_pcm_hw_params_set_period_size_near(capture_handle, hw_params, &frames, 0) < 0)
            throw new std::runtime_error{ "Can't set period" };

        if (snd_pcm_hw_params_set_period_time_near(capture_handle, hw_params, &framesTime, 0) < 0)
            throw new std::runtime_error{ "Can't set period time" };

        if (snd_pcm_hw_params_set_channels(capture_handle, hw_params, channels) < 0)
            throw new std::runtime_error{ "Can't set channels count" };

        if (snd_pcm_hw_params(capture_handle, hw_params) < 0)
            throw new std::runtime_error{ "Can't set parameters" };

        // get actual rate
        unsigned int actualRate{};
        snd_pcm_hw_params_get_rate(hw_params, &actualRate, 0);

        // get period size
        snd_pcm_hw_params_get_period_size(hw_params, &frames, 0);

        // get actual period time
        unsigned int actualPeriodTime{};
        snd_pcm_hw_params_get_period_time(hw_params, &actualPeriodTime, 0);

        // free params struct
        snd_pcm_hw_params_free(hw_params);

        unsigned int bufferSize = (frames * channels * snd_pcm_format_physical_width(SND_PCM_FORMAT_S16_LE)) / 8;

        if (snd_pcm_prepare(capture_handle) < 0)
            throw new std::runtime_error{ "Can't prepare capture device" };

        unsigned int buf[bufferSize];
        while (true) {
            auto rc = snd_pcm_readi(capture_handle, &buf[0], frames);
            if (rc == -EPIPE)
                snd_pcm_prepare(capture_handle);
            else if (rc < 0)
                throw new std::runtime_error{ "Error while reading from device" };
            else if (rc != frames)
                throw new std::runtime_error{ "Error, readed frames must eq. to actual frames" };

            if (connectable != nullptr)
                connectable->sendData(buf, bufferSize);
        }

        snd_pcm_drain(capture_handle);
        snd_pcm_close(capture_handle);
    }

    void AudioDriverLinux::freeDriver() {
        std::cout << "Linux driver unloaded!" << std::endl;
    }
}

#endif