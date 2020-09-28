#ifdef __linux__

#include "../include/msd/AudioDriverLinux.h"
#include <iostream>

namespace msd {
    AudioDriverLinux::AudioDriverLinux(Connectable* connectable) {
        this->connectable = connectable;
    }

    AudioDriverLinux::~AudioDriverLinux() {
    }

    void AudioDriverLinux::initDriver() {
        std::cout << "Linux driver loaded!" << std::endl;
    }

    void AudioDriverLinux::freeDriver() {
        std::cout << "Linux driver unloaded!" << std::endl;
    }
}

#endif