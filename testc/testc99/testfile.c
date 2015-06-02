#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

bool isReadWriteable(const char *filename)
{
	FILE *fp = fopen(filename, "r+");
	if (fp != NULL) {
		long pos = ftell(fp);
		if (pos < 0L)
			perror("ftell()");	// if error, ftell() returns -1
		fclose(fp);
		return true;
	} else {
		return false;
	}
}

int main(int argc, char const *argv[])
{
	printf("Open file ... %d\n", isReadWriteable("Makefile"));
	long double xxl = expl(800);
	printf("e to the power of 1000 is %.2Le\n", xxl);
	return 0;
}
