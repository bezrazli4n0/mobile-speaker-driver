#pragma once

#include "AudioDriverAbstract.h"

namespace msd {
    class AudioDriver;

    class AudioDriverLinux : AudioDriverAbstract {
    private:
        AudioDriverLinux();

    public:
        virtual void initDriver();
        virtual void freeDriver();

        virtual ~AudioDriverLinux();

        friend class AudioDriver;
    };
}