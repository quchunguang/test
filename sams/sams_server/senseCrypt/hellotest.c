/**
 * hellotest.c
 * To compile, use following commands:
 *   gcc -o hellotest -lhello hellotest.c
 */
#include <stdio.h>
int main()
{
    int a = 3, b = 4;
    printf("%d + %d = %d\n", a, b, hello_add(a,b));
    return 0;
}
