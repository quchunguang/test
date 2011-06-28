#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

int main()
{
	printf("uid = %d, euid = %d ", getuid(), geteuid());
	printf("\n");
	return 0;
}
