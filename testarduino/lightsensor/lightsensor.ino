// Function
//      Control LEDs with Light sensor
// Reference
//      http://www.geek-workshop.com/thread-1340-1-1.html
// Connection
//      Light sensor: Gnd->10KOhm->LS->5V;
//                               |->A0.
//      LED: Gnd->330Ohm->ledL->D2;
//           Gnd->330Ohm->ledM->D2;
//           Gnd->330Ohm->ledH->D2.
// Tested
//      arduino uno/nano328

int sensorValue;
int baudrate = 9600;

int ledL = 2;
int ledM = 3;
int ledH = 4;
int ledSerial = 5;
int pinReadLight = A0;

void setup()
{
    Serial.begin(baudrate);

    pinMode(ledL, OUTPUT);
    pinMode(ledM, OUTPUT);
    pinMode(ledH, OUTPUT);
    digitalWrite(ledL, LOW);
    digitalWrite(ledM, LOW);
    digitalWrite(ledH, LOW);

    pinMode(ledSerial, OUTPUT);
    digitalWrite(ledSerial, LOW);
}

void loop()
{
    sensorValue = analogRead(pinReadLight);
    //sensorValue = map(sensorValue, 0, 1023, 100, 999);  //把val的值修改到100至999的范围之间

    Serial.println(sensorValue);
    // if (Serial.available() > 0) {
    //     // read the incoming byte:
    //     char inByte = Serial.read();
    //     if (inByte == '0') {
    //         digitalWrite(ledSerial, LOW);
    //     } else if (inByte == '1') {
    //         digitalWrite(ledSerial, HIGH);
    //     }
    // }

    if (sensorValue > 800) {
        digitalWrite(ledL, HIGH);
        digitalWrite(ledM, HIGH);
        digitalWrite(ledH, HIGH);
    } else if (sensorValue > 400) {
        digitalWrite(ledL, HIGH);
        digitalWrite(ledM, HIGH);
        digitalWrite(ledH, LOW);
    } else if (sensorValue > 100) {
        digitalWrite(ledL, HIGH);
        digitalWrite(ledM, LOW);
        digitalWrite(ledH, LOW);
    } else {
        digitalWrite(ledL, LOW);
        digitalWrite(ledM, LOW);
        digitalWrite(ledH, LOW);
    }

    delay(100);
}
