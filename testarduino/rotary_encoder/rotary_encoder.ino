// http://yehnan.blogspot.com/2014/02/arduino.html
// !!!BUG: jump with add and minus. NO USE
// Connection
// rotary encoder -> arduino uno: CLK->D2,DT->D3,SW->D4,+->5V,GND->GND
#define CLK_PIN 2
#define DT_PIN 3
#define SW_PIN 4

#define interruptA 0                // UNO D2 -> interrupt 0

volatile long count = 0;
unsigned long ts = 0;

void rotaryEncoderChanged() {       // trigger when CLK_PIN is FALLING
    if (millis() - ts < 200) {      // 去彈跳, NO USE!!!
        return;
    }
    ts = millis();
    count += digitalRead(DT_PIN) == HIGH ? 1 : -1;
    Serial.println(count);          // DT_PIN的狀態代表正轉或逆轉
}

void setup() {
    Serial.begin(115200);

    attachInterrupt(interruptA, rotaryEncoderChanged, FALLING);
    pinMode(CLK_PIN, INPUT_PULLUP); // must pulling up
    pinMode(DT_PIN, INPUT_PULLUP);
    pinMode(SW_PIN, INPUT_PULLUP);
}

void loop() {
    if (digitalRead(SW_PIN) == LOW) { // reset
        count = 0;
        Serial.println("count reset to 0");
        delay(300);
    }
}
