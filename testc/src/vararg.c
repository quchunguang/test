/*
 * vararg.c
 *
 *  Created on: 2011-9-23
 *      Author: qcg
 */

#include <stdio.h>
#include <stdarg.h>

void printlist(int begin, ...)
{
	va_list ap;
	char *p;

	va_start(ap, begin);
	while((p = va_arg(ap, char *)) != NULL) {
		fputs(p, stdout);
		putchar('\n');
	}
	va_end(ap);
}
/*
int main(void) {
	int a=1, b=1, c;
	printlist(0, "hello", "world", "foo", "bar", NULL);
	c = (a++, b++, a);
	printf("%d\n", c);
	int i = 0;
	unsigned int sum = 0;
	for (; i < 16; i++)
		sum = sum + (1U<<i); // () is must !
	printf("%x\n", sum);
	return 0;
}
*/
