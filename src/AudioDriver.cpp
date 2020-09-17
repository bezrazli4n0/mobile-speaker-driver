#include "../include/msd/AudioDriver.h"

namespace msd {
    AudioDriverAbstract* AudioDriver::getInstanceForPlatform() {
        #ifdef _WIN32
            return new AudioDriverWindows{};
        #elif __linux__
            return new AudioDriverLinux{};
        #endif
    }
}