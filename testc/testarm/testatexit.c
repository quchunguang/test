#include <stdio.h>
#include <stdlib.h>

void f1(void)
{
        printf("in f1()\n");
}

void f2(void)
{
        printf("in f2()\n");
}

void f3(void)
{
        printf("in f3()\n");
}

int main(int argc, char const *argv[])
{
        printf("Registering the at-exit functions ...");
        if (atexit(f1) || atexit(f2) || atexit(f3))
                printf("failed.\n");
        else
                printf("done.\n");

        printf("Now exiting...\n");
        exit(0);
        // _Exit(0); // not call fn()s
}
