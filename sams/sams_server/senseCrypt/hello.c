/**
 * hello.c
 * To compile, use following commands:
 *   gcc -O -c -fPIC -o hello.o hello.c 
 *   gcc -shared -o libhello.so hello.o
 */

int hello_add(int a, int b)
{
    return a + b;
}
