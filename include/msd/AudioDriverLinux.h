#pragma once

#include "AudioDriverAbstract.h"
#include "Connectable.h"

namespace msd {
    class AudioDriver;

    class AudioDriverLinux : AudioDriverAbstract {
    private:
        Connectable* connectable{};
        AudioDriverLinux(Connectable* connectable = nullptr);

        class impl;
        impl* pImpl{};

    public:
        virtual void initDriver();
        virtual void freeDriver();

        virtual ~AudioDriverLinux();

        friend class AudioDriver;
    };
}