#pragma once

#include "AudioDriverAbstract.h"
#include "Connectable.h"

namespace msd {
    class AudioDriver;

    class AudioDriverLinux : AudioDriverAbstract {
    private:
        Connectable* connectable{};
        AudioDriverLinux(Connectable* connectable = nullptr);

    public:
        virtual void initDriver();
        virtual void freeDriver();

        virtual ~AudioDriverLinux();

        friend class AudioDriver;
    };
}