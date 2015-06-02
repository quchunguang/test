#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>

void alarm_handler(int signum)
{
	signal(SIGALRM, NULL);
	printf("Buzz Buzz Buzz\n");
	signal(SIGALRM, alarm_handler);
	alarm(1);
}

int main()
{
	signal(SIGALRM, alarm_handler);
	alarm(1);
	while (1) {
		pause();
	}
        return EXIT_SUCCESS;
}
