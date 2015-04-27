// Connection
// hc-sr04: trig -> digital pin 12; echo -> digital pin 11; vcc ->5V; gnd -> gnd
#include <NewPing.h>

#define TRIGGER_PIN 12   // Arduino pin tied to trigger pin on the ultrasonic sensor.
#define ECHO_PIN 11      // Arduino pin tied to echo pin on the ultrasonic sensor.
#define MAX_DISTANCE 400 // Maximum distance we want to ping for (in centimeters). Maximum sensor distance is rated at 400-500cm.

NewPing sonar(TRIGGER_PIN, ECHO_PIN, MAX_DISTANCE); // NewPing setup of pins and maximum distance.

void setup() {
    // Open serial monitor at 115200 baud to see ping results.
    Serial.begin(9600);
}

void loop() {
    // Wait 50ms between pings (about 20 pings/sec). 29ms should be the shortest delay between pings.
    delay(50);

    // Send ping, get ping time in microseconds (uS).
    unsigned int uS = sonar.ping();

    // Convert ping time to distance in cm and print result (0 = outside set distance range)
    Serial.println((float)uS / US_ROUNDTRIP_CM);
    delay(500);
}
