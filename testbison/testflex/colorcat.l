%{
#include <stdio.h>
int inQuotes = 0;
%}
%option noyywrap
/*%option caseless*/
%%
^[ \t]*\[INFO\].*$	{
	printf("\033[32m");
	ECHO;
	printf("\033[0m");
	}
^[ \t]*\[WARN\].*$	{
	printf("\033[33m");
	ECHO;
	printf("\033[0m");
	}
^[ \t]*\[ERROR\].*$	{
	printf("\033[31m");
	ECHO;
	printf("\033[0m");
	}
^[ \t]*\[DEBUG\].*$	{
	printf("\033[30;1m");
	ECHO;
	printf("\033[0m");
	}
%%
int main(void)
{
	return yylex();
}
