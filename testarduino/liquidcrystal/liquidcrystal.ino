#include <Wire.h>
#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27, 20, 4); // set the LCD address to 0x27 for a 20 chars and 4 line display
int count = 0;

void setup()
{
    lcd.init();                      // initialize the lcd

    // Print a message to the LCD at initial location (0, 0)
    lcd.backlight();
    lcd.print("Morning Call...");

    // Set location at column 0, row 1
    lcd.setCursor(0, 1);
    lcd.print("Kevin Qu");
}
void loop()
{
    lcd.setCursor(0, 2);
    lcd.print(count++);
    // lcd.clear();
}
