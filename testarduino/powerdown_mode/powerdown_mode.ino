// http://www.geek-workshop.com/thread-12261-1-1.html
#include <avr/sleep.h>
#include <avr/wdt.h>

volatile byte data = 0;

void run() {
    digitalWrite(13, HIGH);
    delay(100);
    digitalWrite(13, LOW);
}

// sleep mode is activated
void setup_watchdog(int ii) {
    byte bb;

    if (ii > 9 ) ii = 9;
    bb = ii & 7;
    if (ii > 7) bb |= (1 << 5);
    bb |= (1 << WDCE);

    MCUSR &= ~(1 << WDRF);
    WDTCSR |= (1 << WDCE) | (1 << WDE); // start timed sequence
    WDTCSR = bb;                        // set new watchdog timeout value
    WDTCSR |= _BV(WDIE);
}

// WDT interrupt
ISR(WDT_vect) {
    ++data;
    // wdt_reset();
}

void Sleep_avr() {
    set_sleep_mode(SLEEP_MODE_PWR_DOWN); // sleep mode is set here
    sleep_enable();
    sleep_mode();                        // System sleeps here
}

void setup() {
    pinMode(13, OUTPUT);

    // 0=16ms, 1=32ms, 2=64ms, 3=128ms, 4=250ms, 5=500ms, 6=1s, 7=2s, 8=4s, 9=8s
    setup_watchdog(9);
    ACSR |= _BV(ACD);   // OFF ACD
    ADCSRA = 0;         // OFF ADC
    Sleep_avr();        // Sleep_Mode
}

void loop() {
    // 8s * 7 = 56s
    if (data >= 7) {
        data = 0;
        run();                          // wakeup and run
    }
    Sleep_avr();                        // continue sleep
}
