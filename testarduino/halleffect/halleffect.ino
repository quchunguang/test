// Hall effect
// left pin: +5V
// middle pin: GND
// right pin: DATA(hallPin) -> R10K -> +5V

int hallPin = 2;
int ledPin = 3;
void setup()
{
    Serial.begin(9600);
    pinMode(hallPin, INPUT);
    pinMode(ledPin, OUTPUT);
    digitalWrite(ledPin, HIGH);
}

void loop()
{
    int sensorValue = digitalRead(hallPin);
    Serial.println(sensorValue);
    if(sensorValue){
        digitalWrite(ledPin, HIGH);
    }else{
        digitalWrite(ledPin, LOW);
    }
    delay(10);
}

