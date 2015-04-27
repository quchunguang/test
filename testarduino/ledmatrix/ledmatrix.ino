/* Pin Mapping for LM12088 8x8 LED Matrix
Arduino   LED Matrix    Designator
 2          9           Row 1      startRowPin
 3         14           Row 2
 4          8           Row 3
 5         12           Row 4
 6          1           Row 5
 7          7           Row 6
 8          2           Row 7
 9          5           Row 8
10         13           Column 1   startColPin
11          3           Column 2
12          4           Column 3
13         10           Column 4
14(A0)      6           Column 5
15(A1)     11           Column 6
16(A2)     15           Column 7
17(A3)     16           Column 8

This pin map works on uno, but NOT on nano328.
*/

const byte ROWS = 8;
const byte COLS = 8;
const int startRowPin = 2;
const int startColPin = 10;

void clearLEDs() {
    for (int r = 0; r < ROWS; r++) {
        digitalWrite( r + startRowPin, LOW);
    }
    for (int c = 0; c < COLS; c++) {
        digitalWrite( c + startColPin, LOW);
    }
}

void setup() {
    for (int r = 0; r < ROWS; r++) {
        pinMode( r + startRowPin, OUTPUT);
    }
    for (int c = 0; c < COLS; c++) {
        pinMode( c + startColPin, OUTPUT);
    }
}

void loop() {
    clearLEDs();

    // 往下而下，一排一排(Row)打開
    for (int r = 0; r < ROWS; r++) {
        digitalWrite( r + startRowPin, HIGH);
        delay(300);
    }

    // 往左而右，一行一行(Column)關掉
    for (int c = 0; c < COLS; c++) {
        digitalWrite(c + startColPin, HIGH);
        delay(300);
    }

    // 暫停 1 秒鐘
    delay(1000);
}
