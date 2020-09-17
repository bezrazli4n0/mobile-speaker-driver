#pragma once

#ifdef _WIN32
    #include "AudioDriverWindows.h"
#elif __linux__
    #include "AudioDriverLinux.h"
#endif

namespace msd {
    class AudioDriver {
    public:
        static AudioDriverAbstract* getInstanceForPlatform();
    };
}