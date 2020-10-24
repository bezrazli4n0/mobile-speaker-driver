#ifdef _WIN32
    #pragma comment(lib, "Ws2_32")

    #define _WINSOCKAPI_

    #include <WinSock2.h>
    #include <ws2tcpip.h>
    #include <Windows.h>
#elif __linux__
    #include <sys/types.h>
    #include <sys/socket.h>
    #include <arpa/inet.h>
    #include <unistd.h>

    #define SOCKET int
#endif

#include "../include/msd/WifiConnector.h"
#include <stdexcept>
#include <thread>

namespace msd {
    class WifiConnector::impl {
    private:
        SOCKET connSocket{};
        SOCKET tcpSocket{};

        sockaddr_in clientAddr{};
        sockaddr_in serverAddr{};
    public:
        impl(const std::string ip, const unsigned short port);
        ~impl();

        void sendRates(const std::string jsonData);
        void sendData(void* data, long size);
    };

    WifiConnector::impl::impl(const std::string ip, const unsigned short port) {
    #ifdef _WIN32
        WSADATA wsaData{};
        WSAStartup(MAKEWORD(2, 2), &wsaData);
    #endif
        // TODO: fix code duplication
        if (connSocket = socket(AF_INET, SOCK_DGRAM, 0); connSocket < 0)
            throw new std::runtime_error{ "UDP socket is not created" };

        serverAddr.sin_family = AF_INET;
        serverAddr.sin_port = htons(port);
        inet_pton(AF_INET, ip.c_str(), &serverAddr.sin_addr);

        if (tcpSocket = socket(AF_INET, SOCK_STREAM, 0); tcpSocket < 0)
            throw new std::runtime_error{ "TCP socket is not created" };

        clientAddr.sin_family = AF_INET;
        clientAddr.sin_port = htons(6768);
        inet_pton(AF_INET, ip.c_str(), &clientAddr.sin_addr);

        connect(tcpSocket, reinterpret_cast<sockaddr*>(&clientAddr), sizeof(clientAddr));
    }

    WifiConnector::impl::~impl() {
    #ifdef _WIN32
        closesocket(tcpSocket);
        closesocket(connSocket);
        WSACleanup();
    #elif __linux__
        close(tcpSocket);
        close(connSocket);
    #endif
    }

    void WifiConnector::impl::sendData(void* data, long size) {
        sendto(connSocket, reinterpret_cast<const char*>(data), size, 0, reinterpret_cast<const sockaddr*>(&serverAddr), sizeof(serverAddr));
    }

    void WifiConnector::impl::sendRates(const std::string jsonData) {
        send(tcpSocket, jsonData.c_str(), jsonData.size(), 0);
    }

    WifiConnector::WifiConnector(const std::string ip, const unsigned short port) {
        pImpl = new impl{ ip, port };
    }

    void WifiConnector::sendRates(const std::string jsonData) {
        pImpl->sendRates(jsonData);
    }

    void WifiConnector::sendData(void* data, long size) {
        pImpl->sendData(data, size);
    }

    WifiConnector::~WifiConnector() {
        delete pImpl;
    }
}