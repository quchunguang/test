%%
 /* match . */
. ECHO;
 /* match \n*/
\n ECHO;
%%
int yywrap(void) {
       return 1;
}
int main(void) {
       yylex();
       return 0;
}
