#include <stdio.h>
#include <pthread.h>

void foo()
{
	while(1)
		sleep(1);
}

int main()
{
	int i = 0;
	pthread_t thread;

	while (1) {
		if (pthread_create(&thread, NULL, (void *)foo, NULL) != 0)
			break;
		i ++;
		printf("\ri = \033[33;46m%d\033[0m", i);
	}
	printf("\n");
	return 0;
}
