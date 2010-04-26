%option noyywrap
/*%option caseless*/
%%
\<USERNAME\> 	printf( "%s", "KEVIN QU" );
%%
int main(void)
{
	return yylex();
}
