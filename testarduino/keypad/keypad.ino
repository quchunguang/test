// Lab18 讀取 3x4 Keypad 的輸入
// http://coopermaa2nd.blogspot.com/2011/01/arduino-lab18-3x4-keypad.html
// 引用 Keypad library
#include <Keypad.h>

// 3x4 Keypad
const byte ROWS = 4; // 4 Rows
const byte COLS = 3; // 3 Columns

// 定義 Keypad 的按鍵
char keys[ROWS][COLS] = {
  {'1','2','3'},
  {'4','5','6'},
  {'7','8','9'},
  {'*','0','#'}
};

// 定義 Keypad 連到 Arduino 的接腳
byte rowPins[ROWS] = {11, 6, 7, 9}; // 連到 Keypad 的 4 個 Rows: Row0, Row1, Row2, Row3
byte colPins[COLS] = {10, 12, 8};   // 連到 Keypad 的 3 個 Columns: Column0, Column1, Column2

// 建立 Keypad 物件
Keypad keypad = Keypad( makeKeymap(keys), rowPins, colPins, ROWS, COLS );

void setup(){
  Serial.begin(9600);
}

void loop(){
  // 讀取 Keypad 的輸入
  char key = keypad.getKey();

  // NO_KEY 代表沒有按鍵被按下
  if (key != NO_KEY){
    // 假如有按鍵被按下，就印出按鍵對應的字元
    Serial.println(key);
  }
}
