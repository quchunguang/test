// Common use as server. Wait for data coming and send response.
// Reference following link for pin mapping.
// https://arduino-info.wikispaces.com/Nrf24L01-2.4GHz-HowTo
// Tested on Raspberry pi 2
//   1 - GND
//   2 - VCC 3.3V !!! NOT 5V
//   3 - CE   to Arduino pin  9
//   4 - CSN  to Arduino pin 10
//   5 - SCK  to Arduino pin 13
//   6 - MOSI to Arduino pin 11
//   7 - MISO to Arduino pin 12
//   8 - UNUSED
#include <SPI.h>
#include "nRF24L01.h"
#include "RF24.h"

RF24 radio(9, 10);   // Set up nRF24L01 radio on SPI bus plus pins 9 & 10

// Radio pipe addresses for the 2 nodes to communicate.
const uint64_t pipes[2] = { 0xF0F0F0F0E1LL, 0xF0F0F0F0D2LL };

void setup(void) {
    Serial.begin(57600);

    radio.begin();              // Setup and configure RF radio

    // optionally, increase the delay between retries & # of retries
    radio.setRetries(15, 15);
    // optionally, reduce the payload size.  seems to improve reliability, max_payload_size = 32
    //radio.setPayloadSize(8);

    radio.openWritingPipe(pipes[1]);
    radio.openReadingPipe(1, pipes[0]);
    radio.startListening();     // Start listening

    // Dump the configuration of the RF unit for debugging
    radio.printDetails();
}

void loop(void) {
    if ( radio.available() ) {
        // Dump the payloads until we've gotten everything
        unsigned long got_time;
        bool done = false;
        while (!done) {
            // Fetch the payload, and see if this was the last one.
            done = radio.read( &got_time, sizeof(unsigned long) );

            // Spew it
            Serial.print("Got payload ");
            Serial.println(got_time);

            // Delay just a little bit to let the other unit
            // make the transition to receiver.
            delay(20);
        }

        // First, stop listening so we can talk
        radio.stopListening();

        // Send the final one back.
        radio.write( &got_time, sizeof(unsigned long) );
        Serial.println("Sent response.");

        // Now, resume listening so we catch the next packets.
        radio.startListening();
    }
}
