#include <time.h>
#include <stdio.h>

int main()
{
	int sec = clock() / CLOCKS_PER_SEC;
	printf("%lu\n", CLOCKS_PER_SEC);
	printf("%lu : %d seconds returned by clock()\n", clock(), sec);

	time_t now;
	time(&now);
	printf("%s\n", ctime(&now));

	struct tm *tmnow = localtime(&now);
	printf("Date: %d-%d-%d\n", tmnow->tm_year + 1900, tmnow->tm_mon + 1,
	       tmnow->tm_mday);
	return 0;
}
