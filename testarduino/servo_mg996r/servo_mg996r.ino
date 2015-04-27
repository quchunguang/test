// http://coopermaa2nd.blogspot.com/2011/01/arduino-lab17-servo.html
// 使用可變電阻控制 Servo 的旋轉角度
// 黄--信号    红--正极    褐--负极
#include <Servo.h>

Servo myservo;
int potpin = A0;                       // 可變電阻接在 Analog pin 0
int servopin = 9;
int val;                               // 儲存旋轉角度的變數

void setup() {
    myservo.attach(servopin);            // Servo 接在 pin 9
}

void loop() {
    val = analogRead(potpin);            // 讀取可變電阻(數值介於 0 到 1023)
    val = map(val, 0, 1023, 0, 179);     // 把 0 - 1023 的數值按比例縮放為 0 - 180 的數值
    myservo.write(val);                  // 設定 Servo 旋轉角度
    delay(15);                           // 等待 Servo 旋轉指定的位置
}
