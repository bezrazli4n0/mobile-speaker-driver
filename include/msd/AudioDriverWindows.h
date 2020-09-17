#pragma once

#include "AudioDriverAbstract.h"

namespace msd {
    class AudioDriver;

    class AudioDriverWindows : AudioDriverAbstract {
    private:
        AudioDriverWindows();

    public:
        virtual void initDriver();
        virtual void freeDriver();

        virtual ~AudioDriverWindows();

        friend class AudioDriver;
    };
}