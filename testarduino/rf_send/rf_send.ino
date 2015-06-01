// Common use as client. Send data and wait for response.
// Reference following link for pin mapping.
// https://arduino-info.wikispaces.com/Nrf24L01-2.4GHz-HowTo
//   1 - GND
//   2 - VCC 3.3V !!! NOT 5V
//   3 - CE to Arduino pin 9
//   4 - CSN to Arduino pin 10
//   5 - SCK to Arduino pin 13
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

    // Dump the configuration of the RF unit for debugging
    radio.printDetails();

    // Become the primary transmitter (ping out)
    radio.openWritingPipe(pipes[0]);
    radio.openReadingPipe(1, pipes[1]);

    radio.startListening();     // Start listening

}

void loop(void) {
    // First, stop listening so we can talk.
    radio.stopListening();

    // Take the time, and send it.  This will block until complete
    unsigned long time = millis();
    Serial.print("Now sending ");
    Serial.print(time);
    if (radio.write( &time, sizeof(unsigned long) )) {
        Serial.println(" OK.");
    }
    else {
        Serial.println(" Failed.");
    }

    // Now, continue listening
    radio.startListening();

    // Wait here until we get a response, or timeout in 200 ms
    unsigned long started_waiting_at = millis();
    while (!radio.available()) {
        if (millis() - started_waiting_at > 200 ) {
            delay(1000);
            return;
        }
    }

    // Grab the response, compare, and send to debugging spew
    unsigned long got_time;
    radio.read( &got_time, sizeof(unsigned long) );
    Serial.print("Got response ");
    Serial.print(got_time);
    Serial.print("round-trip delay: ");
    Serial.println(got_time, millis() - got_time);

    delay(1000);
}
