%option noyywrap
/*%option caseless*/
%%
"/*"	{
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
^[ \t]*\/\/.*\n$ ;
\/\/.*$ ;
%%
int main(void)
{
	return yylex();
}
