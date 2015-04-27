int pinLed = 12;
int pinLedOnBoard = 13;
int timeWaitOn = 100;
int timeWaitOff = 900;

void setup(){
    pinMode(pinLed, OUTPUT);
}

void loop(){
    digitalWrite(pinLedOnBoard, HIGH);
    digitalWrite(pinLed, LOW);
    delay(timeWaitOn);
    digitalWrite(pinLedOnBoard, LOW);
    digitalWrite(pinLed, HIGH);
    delay(timeWaitOff);
}
