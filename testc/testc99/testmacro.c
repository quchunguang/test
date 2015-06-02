#define STR(s) #s
/*
#define ALIGNMENT(n) _Pragma(STR(pack(n)))
ALIGNMENT(1)
same as*/
#pragma pack(1)			// 对齐字节，没有填充

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define printLog(...) fprintf(fp_log, __VA_ARGS__)
#define printDBL(exp) printf(#exp " = %f\n", exp)	// stringizing operator #
#define showArgs(...) puts(#__VA_ARGS__)
#define TEXT_A "hello world!"
#define msg(x) puts(TEXT_ ## x)	// join operator ##

int main(int argc, char const *argv[])
{
	FILE *fp_log = fopen("log.txt", "a");
	printLog("%s: error\n", __func__);
	fclose(fp_log);

	printDBL(4 * atan(1.0));
	showArgs(one\n, "2\n", three);
	msg(A);

#if defined(__unix__) && defined(__GNUC__)
	printf("unix and gnu\n");
#endif

#ifndef __GNUC__
#error "This compiler does not comform ANSI C standard."
#endif

#line 1200 "primary.c"
	printf("File: %s\tFunc: %s()\tLine: %d\n", __FILE__, __func__,
	       __LINE__);

	// ISO C defines:
	printf("%s = %s\n", STR(__DATE__), __DATE__);
	printf("%s = %s\n", STR(__FILE__), __FILE__);
	printf("%s = %d\n", STR(__LINE__), __LINE__);
	printf("%s = %s\n", STR(__TIME__), __TIME__);
	printf("%s = %d\n", STR(__STDC__), __STDC__);
	printf("%s = %d\n", STR(__STDC_HOSTED__), __STDC_HOSTED__);
	printf("%s = %ld\n", STR(__STDC_VERSION__), __STDC_VERSION__);

	return 0;
}
