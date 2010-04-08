#include <stdio.h> 
#include <stdlib.h>
#include <unistd.h>
#ifdef _CHECK_MEM
	#include <mcheck.h>
#endif
struct test{
	int a;
	int b;
};

int main(void)
{
#ifdef _CHECK_MEM
	mtrace();
#endif
	int* aaa = malloc(sizeof(int));
	int count = 0;
	char outstr[10] = {0};
	struct test a;

	system("rm out.log");
	system("echo \"==========Program started===========\" >> out.log");
	while(count < 10){
		sprintf(outstr, "echo \"%05d s \" >> out.log", count++);
		system(outstr);
		sleep(1);
	}
	a.a = 1;
	a.b = 3;
	return 0;
}
