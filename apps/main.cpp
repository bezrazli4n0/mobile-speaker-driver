#include <iostream>
#include "../include/msd/AudioDriver.h"
#include "../include/msd/WifiConnector.h"

int main() {
    msd::WifiConnector wifiConnector{ "192.168.88.192", 6767 };
    msd::AudioDriverAbstract* driver = msd::AudioDriver::getInstanceForPlatform(&wifiConnector);

    try {
        auto [rate, channels] = driver->getRates();
        std::cout << rate << " " << channels << std::endl;
        driver->initDriver();
        driver->freeDriver();
    }
    catch (const std::exception* e) {
        std::cout << e->what() << std::endl;
    }
    
    delete driver;

    return 0;
}