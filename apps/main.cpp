#include <iostream>
#include <string>
#include <regex>
#include <sstream>
#include "../include/msd/AudioDriver.h"
#include "../include/msd/WifiConnector.h"
#include "cxxopts.hpp"

bool validateIP(const std::string& ip) {
  std::regex ipv4("(([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])");
  if (std::regex_match(ip, ipv4)) 
    return true;

  return false; 
}

int main(int argc, const char* argv[]) {
  cxxopts::Options options("PocketSpeakerDriver", "Utility to stream audio in different ways - created by kkgroup.");

  options.add_options()
      ("ip", "Destination ip address", cxxopts::value<std::string>())
      ("rates", "Display rates in json format")
      ("h,help", "Print this")
  ;

  auto result = options.parse(argc, argv);
  
  if (result.count("help")) {
    std::cout << options.help() << std::endl;
    return 0;
  }

  if (result.count("rates")) {
    msd::AudioDriverAbstract* driver = msd::AudioDriver::getInstanceForPlatform(nullptr);
    auto [rate, channels] = driver->getRates();
    std::cout << "{\"rate\":" << rate << ",\"channels\":" << channels << "}" << std::endl;
    return 0;
  }

  std::string destIP{};
  if (result.count("ip")) {
    destIP = result["ip"].as<std::string>();
    if (!validateIP(destIP)) {
      std::cout << options.help() << std::endl;
      return 0;
    }

    const unsigned int port{ 6767 };
    msd::WifiConnector wifiConnector{ destIP, port };
    msd::AudioDriverAbstract* driver = msd::AudioDriver::getInstanceForPlatform(&wifiConnector);

    auto [rate, channels] = driver->getRates();
    std::stringstream ratesStream{};
    ratesStream << "{\"rate\":" << rate << ",\"channels\":" << channels << "}";
    std::string jsonRates = ratesStream.str();
    wifiConnector.sendRates(jsonRates);

    std::cout << "Started on " << destIP << ":" << port << std::endl;
    driver->initDriver();
    driver->freeDriver();
    delete driver;
  } else
    std::cout << options.help() << std::endl;

  return 0;
}