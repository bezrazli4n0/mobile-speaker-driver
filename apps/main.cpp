#include <iostream>
#include <string>
#include "../include/msd/AudioDriver.h"
#include "../include/msd/WifiConnector.h"

void printHelp() {
    std::cout << "Provide valid argument:\n--rates - for display json of actual rate and channels count.\n--ip=<client_ip> - for provide client ip and start server." << std::endl;
}

int main(int argc, const char* argv[]) {
    if (argc > 1) {
        try {
            std::string arg{ argv[1] };
            if (arg == std::string{ "--rates" }) {
                msd::AudioDriverAbstract* driver = msd::AudioDriver::getInstanceForPlatform(nullptr);
                auto [rate, channels] = driver->getRates();
                std::cout << "{\"rate\":" << rate << ",\"channels\":" << channels << "}" << std::endl;
                return 0;
            } else if (arg.find("--ip=") != std::string::npos) {
                std::string clientIP = arg.substr(arg.find("--ip=") + 5);
                if (clientIP.length() <= 0) {
                    std::cout << "Bad IP!" << std::endl;
                    printHelp();
                    return -1;
                } else {
                    const unsigned int port{ 6767 };
                    msd::WifiConnector wifiConnector{ clientIP, port };
                    msd::AudioDriverAbstract* driver = msd::AudioDriver::getInstanceForPlatform(&wifiConnector);
                    std::cout << "Started on " << clientIP << ":" << port << std::endl;
                    driver->initDriver();
                    driver->freeDriver();
                    delete driver;
                }
                return 0;
            } else {
                std::cout << "Bad argument!" << std::endl;
                printHelp();
                return -1;
            }
        } catch (std::exception* e) {
            std::cout << e->what() << std::endl;
            return -1;
        }
    } else
        printHelp();

    return 0;
}