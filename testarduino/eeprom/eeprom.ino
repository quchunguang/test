// 1024B on the ATmega328
// 512B on the ATmega168 and ATmega8
// 4KB on the ATmega1280 and ATmega2560.
#include <EEPROM.h>

int a = 0;
int value;

void setup()
{
    Serial.begin(9600);
    pinMode(2, OUTPUT);
}

void loop()
{
    // EEPROM.write(a, lowByte(a));
    value = EEPROM.read(a);

    Serial.print("Address = ");
    Serial.print(a);
    Serial.print("\t");
    Serial.print("Value = ");
    Serial.print(value);
    Serial.println();

    if (++a == 1024){
        a = 0;
    }

    delay(50);
}
