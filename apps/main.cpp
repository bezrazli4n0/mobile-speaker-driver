#include <iostream>
#include "../include/msd/AudioDriver.h"
#include "../include/msd/WifiConnector.h"

int main() {
    msd::WifiConnector wifiConnector{ "192.168.88.192", 6767 };
    msd::AudioDriverAbstract* driver = msd::AudioDriver::getInstanceForPlatform(&wifiConnector);
    
    driver->initDriver();
    driver->freeDriver();

    delete driver;

    return 0;
}