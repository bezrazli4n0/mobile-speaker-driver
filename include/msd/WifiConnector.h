#pragma once

#include "Connectable.h"
#include <string>

namespace msd {
    class WifiConnector : public Connectable {
    private:
        class impl;
        impl* pImpl{};

    public:
        WifiConnector(const std::string ip, const unsigned short port);
        ~WifiConnector();

        virtual void sendData(void* data, long size);
    };
}