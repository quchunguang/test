/*
 * myprintf.c
 *
 *  Created on: 2011-9-23
 *      Author: qcg
 */

#include <stdio.h>
#include <stdarg.h>

void myprintf(const char *format, ...)
{
	va_list ap;
	char c;

	va_start(ap, format);
	while ((c = *format++) != 0) {
		switch(c) {
			case 'c': {
				/* char is promoted to int when passed through '...' */
				char ch = va_arg(ap, int);
				putchar(ch);
				break;
			}
			case 's': {
				char *p = va_arg(ap, char *);
				fputs(p, stdout);
				break;
			}
			default: {
				putchar(c);
				break;
			}
		}
	}
	va_end(ap);
}
/*
int main(void) {
	myprintf("c\ts\n", '1', "hello");
	return 0;
}
*/
