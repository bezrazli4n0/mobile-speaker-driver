#pragma once

#include <utility>

namespace msd {
    class AudioDriverAbstract {
    public:
        virtual void initDriver() = 0;
        virtual void freeDriver() = 0;
        virtual std::pair<unsigned int, unsigned int> getRates() = 0;
    };
}