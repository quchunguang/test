#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <sys/time.h>
#include <unistd.h>

void catch_alarm (int sig)
{
	printf("Alarm event\n");
	signal(sig, catch_alarm);
}

int main(void)
{
	struct itimerval new;
	signal(SIGALRM, catch_alarm);
	new.it_interval.tv_sec = 1;
	new.it_interval.tv_usec = 500000;
	new.it_value.tv_sec = 1;
	new.it_value.tv_usec = 500000;

	if (setitimer(ITIMER_REAL, &new, NULL) < 0)
		printf("timer init failed\n");
	else
		printf("timer init succeeded\n");
	while (1)
		sleep(2);
	return EXIT_SUCCESS;
}
