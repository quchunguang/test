int pinLed = 13;
int timeWaitOn = 100;
int timeWaitOff = 900;

void setup(){
    pinMode(pinLed, OUTPUT);
}

void loop(){
    digitalWrite(pinLed, HIGH);
    delay(timeWaitOn);
    digitalWrite(pinLed, LOW);
    delay(timeWaitOff);
}
