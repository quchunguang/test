void setup() {
    Serial.begin(9600);
    for (int i = 2; i <= 11; i++) {
        pinMode(i, OUTPUT);
        digitalWrite(i, HIGH);
    }
}
void loop() {
    for (int i = 2; i <= 11; i++) {
        digitalWrite(i, random(2));
    }
    delay(100);
}
