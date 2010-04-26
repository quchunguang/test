%{
#include <stdio.h>
%}
%%
[a-zA-Z][a-zA-Z0-9]*  printf("WORD ");
[a-zA-Z0-9\/.-]+      printf("FILENAME ");
\"                    printf("QUOTE ");
\{                    printf("OBRACE ");
\}                    printf("EBRACE ");
;                     printf("SEMICOLON ");
\n                    printf("\n");
[ \t]+
%%
int yywrap(void)
{
        return 1;
}

int yyerror(char *s)
{
        fprintf(stderr, "%s\n", s);
        return 0;
}

int main(int argc, char *argv[])
{
        FILE *fp;
        fp = fopen(argv[1], "r");

        yyin = fp;

        yylex();

        fclose(fp);
        return 0;
}
