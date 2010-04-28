%{
#include <stdio.h>
int inQuotes = 0;
%}
%option noyywrap
/*%option caseless*/
%%
"/*"	{
	if ( inQuotes ) {
		REJECT;
	}
	register int c;

	for ( ; ; ) {
		/* eat up text of comment */
		while ( (c = input()) != '*' && c != EOF ) ;    

		if ( c == '*' ) {
			while ( (c = input()) == '*' ) ;
			if ( c == '/' )
				break;    /* found the end */
		}
		if ( c == EOF ) {
			fprintf( stderr, "Sytax error: EOF in comment" );
			break;
		}
	}
}
\" 	{ ECHO; inQuotes = ! inQuotes; }
\\\" 	{ ECHO; }

^[ \t]*\/\/.*\n$ ;
\/\/.*$ ;
%%
int main(void)
{
	return yylex();
}
