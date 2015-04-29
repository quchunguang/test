#include <cstdlib>
#include <iostream>
#include <sstream>
#include <string>
#include <RF24/RF24.h>

using namespace std;
// Radio CE Pin, CSN Pin, SPI Speed
// See http://www.airspayce.com/mikem/bcm2835/group__constants.html#ga63c029bd6500167152db4e57736d0939 and the related enumerations for pin information.
// Setup for RPi 2
RF24 radio(RPI_V2_GPIO_P1_22, RPI_V2_GPIO_P1_24, BCM2835_SPI_SPEED_8MHZ);
/****************** Linux (BBB,x86,etc) ***********************/
// See http://tmrh20.github.io/RF24/pages.html for more information on usage
// See http://iotdk.intel.com/docs/master/mraa/ for more information on MRAA
// See https://www.kernel.org/doc/Documentation/spi/spidev for more information on SPIDEV
// Setup for ARM(Linux) devices like BBB using spidev (default is "/dev/spidev1.0" )
//BBB Alternate, with mraa
// CE pin = (Header P9, Pin 13) = 59 = 13 + 46
//Note: Specify SPI BUS 0 or 1 instead of CS pin number.
//RF24 radio(59,0);

// Radio pipe addresses for the 2 nodes to communicate.
const uint64_t pipes[2] = { 0xF0F0F0F0E1LL, 0xF0F0F0F0D2LL };
const int min_payload_size = 4;
const int max_payload_size = 32;
const int payload_size_increments_by = 1;
int next_payload_size = min_payload_size;

char receive_payload[max_payload_size + 1]; // +1 to allow room for a terminating NULL char

int main(int argc, char** argv) {
    radio.begin();
    //radio.enableDynamicPayloads();
    //radio.setAutoAck(1);
    radio.setRetries(15, 15);
    //radio.setDataRate(RF24_1MBPS);
    //radio.setPALevel(RF24_PA_MAX);
    //radio.setChannel(76);
    //radio.setCRCLength(RF24_CRC_16);
    radio.openWritingPipe(pipes[1]);
    radio.openReadingPipe(1, pipes[0]);
    radio.startListening();
    radio.printDetails();

    while (1) {
        if (radio.available()) {
            // Dump the payloads until we've gotten everything
            //uint8_t len = 0;
            unsigned long got_time;

            while (radio.available()) {
                // Fetch the payload, and see if this was the last one.
                //len = radio.getDynamicPayloadSize();
                //radio.read( receive_payload, len );
                // Put a zero at the end for easy printing
                //receive_payload[len] = 0;
                // Spew it
                //printf("Got payload size=%i value=%s\n\r",len,receive_payload);
                radio.read(&got_time, sizeof(unsigned long));
                printf("Got payload %ld\n", got_time);
            }

            // First, stop listening so we can talk
            radio.stopListening();

            // Send the final one back.
            //radio.write( receive_payload, len );
            //printf("Sent response.\n");
            radio.write(&got_time, sizeof(unsigned long));
            printf("Send response from raspberry pi 2\n");

            // Now, resume listening so we catch the next packets.
            radio.startListening();
        }
    }
}

