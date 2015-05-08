#include <8052.h>
#define NOP __asm \
nop \
__endasm

#define THREENOPS NOP; \
NOP; \
NOP

void delay(int millisecond)
{
    while (millisecond--) {
        int n = 70;
        while (n--) {
            THREENOPS;
        }
    }
}

void main(void)
{
    P1 = 0x02;
    while (1) {
        delay(1000);
        P1 = ~P1;
    }
}
