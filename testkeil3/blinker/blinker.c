#include <regx52.h>

void msdelay(unsigned int a);

void main()
{
while(1) {
P1=0xff;
msdelay(200);
P1=0x00;
msdelay(200);
}
}

void msdelay(unsigned int a)
{
unsigned int i,j;
for(i=0;i<a;i++)
for(j=0;j<1275;j++);
}