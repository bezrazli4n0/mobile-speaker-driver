#pragma once

#include "AudioDriverAbstract.h"
#include "Connectable.h"

namespace msd {
    class AudioDriver;

    class AudioDriverWindows : AudioDriverAbstract {
    private:
        Connectable* connectable{};
        AudioDriverWindows(Connectable* connectable = nullptr);

        class impl;
        impl* pImpl{};

        void init();
        void audioLoopback();
        void initAvrt();
    public:
        virtual void initDriver();
        virtual void freeDriver();

        virtual ~AudioDriverWindows();

        friend class AudioDriver;
    };
}