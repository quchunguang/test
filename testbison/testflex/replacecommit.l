%option noyywrap
/*%option caseless*/
%%
<RT> 		printf("\n");
\/\*.*\*\/ 	printf( "%s", "<c>" );
%%
int main(void)
{
	return yylex();
}
