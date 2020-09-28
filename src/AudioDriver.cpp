#include "../include/msd/AudioDriver.h"

namespace msd {
    AudioDriverAbstract* AudioDriver::getInstanceForPlatform(Connectable* connectable) {
        #ifdef _WIN32
            return new AudioDriverWindows{ connectable };
        #elif __linux__
            return new AudioDriverLinux{ connectable };
        #endif
    }
}