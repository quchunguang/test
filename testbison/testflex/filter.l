%{
#include <stdio.h>
int inQuotes = 0;
%}
%option noyywrap
/*%option caseless*/
%%
[A-Za-z][A-Za-z0-9_]*[ \t]*\(	{
	ECHO;
	printf("\n");
	}
.       ;
%%
int main(void)
{
	return yylex();
}
