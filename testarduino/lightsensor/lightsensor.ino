int sensorValue;

void setup()
{
    Serial.begin(9600);

    pinMode(2, OUTPUT);
    pinMode(3, OUTPUT);
    pinMode(4, OUTPUT);
    digitalWrite(2, LOW);
    digitalWrite(3, LOW);
    digitalWrite(4, LOW);

    pinMode(5, OUTPUT);
    digitalWrite(5, LOW);
}

void loop()
{
    sensorValue = analogRead(A0);
    //sensorValue = map(sensorValue, 0, 1023, 100, 999);  //把val的值修改到100至999的范围之间

    //Serial.println(sensorValue);
    if (Serial.available() > 0) {
        // read the incoming byte:
        char inByte = Serial.read();
        if (inByte == '0') {
            digitalWrite(5, LOW);
        } else if (inByte == '1') {
            digitalWrite(5, HIGH);
        }
    }

    if (sensorValue > 800) {
        digitalWrite(2, HIGH);
        digitalWrite(3, HIGH);
        digitalWrite(4, HIGH);
    } else if (sensorValue > 400) {
        digitalWrite(2, HIGH);
        digitalWrite(3, HIGH);
        digitalWrite(4, LOW);
    } else if (sensorValue > 100) {
        digitalWrite(2, HIGH);
        digitalWrite(3, LOW);
        digitalWrite(4, LOW);
    } else {
        digitalWrite(2, LOW);
        digitalWrite(3, LOW);
        digitalWrite(4, LOW);
    }

    delay(100);
}
