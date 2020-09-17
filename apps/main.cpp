#include <iostream>
#include "../include/msd/AudioDriver.h"

int main() {
    msd::AudioDriverAbstract* driver = msd::AudioDriver::getInstanceForPlatform();
    
    driver->initDriver();
    driver->freeDriver();
    delete driver;

    return 0;
}