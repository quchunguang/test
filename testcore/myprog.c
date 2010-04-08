#include <stdio.h>
#include <dlfcn.h>
#include "myproc.h"

int a = 0x01234567;
const char* program_name = {"http://bvi.sourceforge.net/index.html"};
double double_value = 1.0f;
int intvalue = 8;

typedef struct
{
	float a;
	float b;
}substruct;

struct
{
	int i;
	substruct r;
}c,d;

void calldll();
void calldllmain();

/*******************************Implimentation*********************************/
/* #define testmacro() ({ii=3;jj=4;}) */
void calldll()
{
	void* handle = dlopen ("ddlltest.so", RTLD_LAZY);
	void (*test)() = dlsym (handle, /*"errddlltest"*/"ddlltest");
	(*test)();
	dlclose (handle);
}
void calldllmain()
{
	calldll();
}
int main()
{
	int n=4;
	/* int m[10]={0,1,4,9,16,25,36,49,64,81};
	n=testmacro(); */
	myproc(n);

	c.i=1;
	c.r.a=0.5;
	c.r.b=0.25;
	calldllmain();
	printf("a=0x%08x\n", a);

	return 0;
}
