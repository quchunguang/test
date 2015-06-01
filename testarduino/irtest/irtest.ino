// http://yehnan.blogspot.com/2013/05/arduino.html
// Vout  D8
// Gnd   Gnd
// Vcc   5V
#include <IRremote.h>

int RECV_PIN = 8;       // 使用數位腳位12接收紅外線訊號
decode_results results;  // 儲存訊號的結構
IRrecv irrecv(RECV_PIN); // 初始化紅外線訊號輸入

void setup()
{
    Serial.begin(9600);
    irrecv.blink13(true); // 設為true的話，當收到訊號時，腳位13的LED便會閃爍
    irrecv.enableIRIn();  // 啟動接收
}

void loop() {
    if (irrecv.decode(&results)) {         // 接收紅外線訊號並解碼
        Serial.print("results value is "); // 輸出解碼後的資料
        Serial.print(results.value, HEX);
        Serial.print(", bits is ");
        Serial.print(results.bits);
        Serial.print(", decode_type is ");
        Serial.println(results.decode_type);
        irrecv.resume();                   // 準備接收下一個訊號
    }
}
