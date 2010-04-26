%{
    #include <stdlib.h>
    int yyerror(char *);
    #include "test2yy.h"
%}
%%
[a-z]        {
                 yylval = *yytext - 'a';
                 return VARIABLE;
             }
[0-9]+       {
                 yylval = atoi(yytext);
                 return INTEGER;
             }
[-+()=/*\n]  { return *yytext; }
[ \t]        ;
%%
int yywrap(void)
{
    return 1;
}
