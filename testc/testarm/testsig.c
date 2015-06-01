#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>  // SIG_ATOMIC_MAX
#include <signal.h>
#include <ctype.h>


volatile sig_atomic_t i;

void sigint_handle(int sig)
{
        char c;
        if (sig != SIGINT)
                exit(1);
        signal(SIGINT, SIG_IGN); // ignore new comming SIGINT
        puts("\nThis is in function sigint_handle, do you want to exit (y/n)?");
        while ((c = tolower(getchar())) != 'y' && c != 'n' );
        if (c == 'y')
                exit(0);        // exit successfully
        else
                i = 0;          // restart counting

        signal(SIGINT, sigint_handle); // reinstall signal handle
}

int main(int argc, char const *argv[])
{
        if (signal(SIGINT, sigint_handle)) {
                perror("Install signal error!");
                exit(3);
        }
        while (1) {
                puts("Press Ctrl+C to interrupt me ...");
                for (i = 0; i < SIG_ATOMIC_MAX; ++i) {
                        if (i % 100000 == 0) {
                                printf("\r%d", i / 100000);
                                fflush(stdout);
                        }
                }
                raise(SIGINT);  // if not press Ctrl+C
        }

        return 0;
}
