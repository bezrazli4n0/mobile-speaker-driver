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
        virtual std::pair<unsigned int, unsigned int> getRates();

        virtual ~AudioDriverLinux();

        friend class AudioDriver;
    };
}