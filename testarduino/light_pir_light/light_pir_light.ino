// Function
//      Control light with VS1838B and relay
// Reference
//      http://shop.cpu.com.tw/product/46922/info/
//      http://yehnan.blogspot.com/2013/05/arduino.html
// Connection
//      PIR sensor->Arduino: OUT->D7; Vcc->5V; Gnd->Gnd.
//      VS1838B sensor->Arduino: Vout->D8;  Gnd->Gnd; Vcc->5V.
//      Relay module->Arduino: Gnd->Gnd; In1->D5; In2->D6; Vcc->5V.
//      Relay module->Power switcher: NO1->AC PowerA1; NO2->AC PowerA2.
//      Relay module->Power switcher: COM1->COM2->AC PowerB.
// Tested on arduino uno/nano328
#include <IRremote.h>
#include "../ircode_qcg.h"

#define RELAY_OFF   HIGH // HIGH->turn off light; open in common-open of relay
#define RELAY_ON    LOW

bool light = RELAY_OFF;
// int duration = 300;
// int pinPir = 7;

int pinIR = 8;             // IR data pin
IRrecv irrecv(pinIR);       // IR initialize
decode_results results;     // IR information received

int pinRelay1 = 5;
int pinRelay2 = 6;

void setup() {
    Serial.begin(9600);

    // pinMode(pinPir, INPUT);
    irrecv.blink13(true);   // built-in led_13 blink when IR receive
    irrecv.enableIRIn();    // enable IR receive

    pinMode(pinRelay1, OUTPUT);
    pinMode(pinRelay2, OUTPUT);
    digitalWrite(pinRelay1, light);
    digitalWrite(pinRelay2, RELAY_OFF);

    Serial.print("System initialized, Light is ");
    Serial.println(light == RELAY_ON ? "ON" : "OFF");
}

void loop() {
    // if (!light && !digitalRead(pinPir)) {
    //     delay(duration);
    //     if(!light && !digitalRead(pinPir)){
    //         light = true;
    //         Serial.println("Light is turn on");
    //     }
    // } else if (light && digitalRead(pinPir)){
    //     delay(duration);
    //     if(light && digitalRead(pinPir)){
    //         light = false;
    //         Serial.println("Light is turn off");
    //     }
    // }

    // IR received
    if (irrecv.decode(&results)) {
        if ( results.value == KEY_RED || results.value == KEY_RED_LONG) {
            // switch light
            light = !light;
            digitalWrite(pinRelay1, light);
            Serial.print("TV key Pressed, Now Light turned ");
            Serial.println(light == RELAY_ON ? "ON" : "OFF");
        }
        irrecv.resume();    // wait for next receive
    }
}
