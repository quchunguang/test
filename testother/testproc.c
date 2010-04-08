#include<stdio.h>
#include<wait.h>
int main()
{
	int i;
	for(i=0;i<100;i++) {
		printf("Hello world\n");
		sleep(2);
	}
	return 0;
}
