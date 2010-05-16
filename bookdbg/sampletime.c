#include <stdio.h>
#include <unistd.h>
#include <sys/time.h>

struct timeval start, finish ;
int msec;

int main ()
{
	gettimeofday (&start, NULL);

	sleep (2); /* wait ~ 200 seconds */

	gettimeofday (&finish, NULL);

	msec = finish.tv_sec * 1000 + finish.tv_usec / 1000;
	msec -= start.tv_sec * 1000 + start.tv_usec / 1000;

	printf("Time: %d milliseconds\n", msec);
	return 0;
}
