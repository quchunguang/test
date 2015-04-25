#include <cstdlib>
#include <iostream>
#include "../../share/rf24libs/RF24/RF24.h"

using namespace std;

// spi device, spi speed, ce gpio pin
RF24 radio("/dev/spidev0.0", 8000000, 25);

void setup(void)
{
    // init radio for reading
    radio.begin();
    radio.enableDynamicPayloads();
    radio.setAutoAck(1);
    radio.setRetries(15, 15);
    radio.setDataRate(RF24_1MBPS);
    radio.setPALevel(RF24_PA_MAX);
    radio.setChannel(76);
    radio.setCRCLength(RF24_CRC_16);
    radio.openReadingPipe(1, 0xF0F0F0F0E1LL);
    radio.startListening();
}

void loop(void)
{
    // 32 byte character array is max payload
    char receivePayload[32];

    while (radio.available())
    {
        // read from radio until payload size is reached
        uint8_t len = radio.getDynamicPayloadSize();
        radio.read(receivePayload, len);

        // display payload
        cout << receivePayload << endl;
    }
}

int main(int argc, char** argv)
{
    setup();
    while (1)
        loop();

    return 0;
}
