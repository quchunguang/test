
#include <stdio.h>

void function1()
{
	int i, j;
	for(i = 0; i < 20000; i++)
		j += i;
}

void function2()
{
	int i, j;
	function1();
	for(i = 0; i < 20000; i++)
		j = i;
}

int main()
{
	int i, j;
	for(i = 0; i < 100; i++)
		function1();
	for(i = 0; i < 50000; i++)
		function2();
	return 0;
}
