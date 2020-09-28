#pragma once

namespace msd {
    class Connectable {
    public:
        virtual void sendData(void* data, long size) = 0;
    };
}