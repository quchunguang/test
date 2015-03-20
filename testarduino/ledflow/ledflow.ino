#include <IRremote.h>

#define REDKEY 0x2FFCA35
#define GREENKEY 0x2FFDA25
#define YELLOWKEY 0x2FFEA15
#define BLUEKEY 0x2FF2AD5

int RECV_PIN = 12;       // 使用數位腳位2接收紅外線訊號
IRrecv irrecv(RECV_PIN); // 初始化紅外線訊號輸入
decode_results results;  // 儲存訊號的結構
int poweron = 0;

void setup() {
    Serial.begin(115200);
    irrecv.enableIRIn();  // 啟動接收

    for (int i = 2; i <= 11; i++) {
        pinMode(i, OUTPUT);
        digitalWrite(i, HIGH);
    }
}

void loop() {
    if (irrecv.decode(&results)) {         // 接收紅外線訊號並解碼
        if (results.value == REDKEY) {
            poweron = !poweron;
        }
        irrecv.resume();                   // 準備接收下一個訊號
    }
    if (poweron) {
        for (int i = 2; i <= 11; i++) {
            digitalWrite(i, random(2));
        }
    } else {
        for (int i = 2; i <= 11; i++) {
            digitalWrite(i, LOW);
        }
    }
    delay(100);
}
