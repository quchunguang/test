void setup(){
    Serial.begin(115200);
}

void loop(){
    int readValue = analogRead(A0);
    float voltage = readValue / 1024.0 * 5.0;
    Serial.println(voltage);
    int writeValue = readValue / 1024.0 * 256.0;
    analogWrite(5, writeValue);
    delay(300);
}
