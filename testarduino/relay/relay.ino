void setup(){
    pinMode(5, OUTPUT);
    digitalWrite(5, HIGH);
}

void loop(){
    delay(5000);
    digitalWrite(5, LOW);
    delay(5000);
    digitalWrite(5, HIGH);
}
