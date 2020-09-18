#include "gtest/gtest.h"
#include "../include/msd/AudioDriver.h"

class AudioDriverTest : public testing::Test {
public:
    msd::AudioDriverAbstract* driver{};

    virtual void SetUp() override {
        driver = msd::AudioDriver::getInstanceForPlatform();
    }

    virtual void TearDown() override {
        delete driver;
    }
};

TEST_F(AudioDriverTest, CheckIfDriverLoadedCorrectly) {
    ASSERT_NO_THROW(driver->initDriver());
    ASSERT_NO_THROW(driver->freeDriver());
}