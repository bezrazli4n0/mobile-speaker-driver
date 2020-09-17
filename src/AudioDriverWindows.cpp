#include "../include/msd/AudioDriverWindows.h"
#include <iostream>

namespace msd {
    AudioDriverWindows::AudioDriverWindows() {
    }

    AudioDriverWindows::~AudioDriverWindows() {
    }

    void AudioDriverWindows::initDriver() {
        std::cout << "Windows driver loaded!" << std::endl;
    }

    void AudioDriverWindows::freeDriver() {
        std::cout << "Windows driver unloaded!" << std::endl;
    }
}