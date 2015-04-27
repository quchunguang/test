// Lab12 使用兩顆 74HC595 和三支腳位控制 16 顆 LED
typedef unsigned int uint16;

// 接 74HC595 的 ST_CP (pin 12,latch pin)
int latchPin = 8;
// 接 74HC595 的 SH_CP (pin 11, clock pin)
int clockPin = 7;
// 接 74HC595 的 DS (pin 14)
int dataPin = 11;

void setup() {
    // 將 latchPin, clockPin, dataPin 設置為輸出
    pinMode(latchPin, OUTPUT);
    pinMode(clockPin, OUTPUT);
    pinMode(dataPin, OUTPUT);
}

void display16(uint16 data) {
    byte high_Byte = highByte(data);
    byte low_Byte = lowByte(data);

    // 送資料前要先把 latchPin 拉成低電位
    digitalWrite(latchPin, LOW);
    // 先送高位元組 (Hight Byte), 給離 Arduino 較遠的那顆 74HC595
    shiftOut(dataPin, clockPin, MSBFIRST, high_Byte);
    // 再送低位元組 (Low Byte), 給離 Arduino 較近的那顆 74HC595
    shiftOut(dataPin, clockPin, MSBFIRST, low_Byte);
    // 送完資料後要把 latchPin 拉回成高電位
    digitalWrite(latchPin, HIGH);
}

void loop() {
    // Water flow led
    for (int led = 0; led < 16; led++) {
        display16(1 << led);
        delay(50);
    }

    // Additional led
    // for (uint16 count = 0; count < 65536; count++) {
    //     display16(count);
    //     delay(50);
    // }
}
