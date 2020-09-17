#pragma once

namespace msd {
    class AudioDriverAbstract {
    public:
        virtual void initDriver() = 0;
        virtual void freeDriver() = 0;
    };
}