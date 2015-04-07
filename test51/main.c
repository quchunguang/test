#include <8052.h>
#define NOP __asm \
nop \
__endasm

#define THREENOPS NOP; \
NOP; \
NOP

void main(void)
{
    int n = 500;
    P1 = 0x02;
    while(1){
        while(n--);
        n = 10000;
        P1 = ~P1;
        THREENOPS;
    }
}
