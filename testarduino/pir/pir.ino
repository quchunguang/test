// Reference : http://shop.cpu.com.tw/product/46922/info/

int pinSound = 6;   // connect tone direct to digit pin 6
int pinPir = 7;     // PIR sensor: OUT ->digit pin 7; Vcc -> 5V; Gnd -> Gnd
int pinLed = 13;
int duration = 1000;

void setup() {
    pinMode(pinSound, OUTPUT);
    pinMode(pinPir, INPUT);
    pinMode(pinLed, OUTPUT);
}

void loop() {
    if (digitalRead(pinPir)) {
        digitalWrite(pinLed, HIGH);
        tone(pinSound, 523, duration);
        delay(duration);
        noTone(pinSound);
    } else {
        digitalWrite(pinLed, LOW);
        delay(duration);
    }
}
