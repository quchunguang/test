     %{
       #include <stdio.h> /* For main */
       #include <stdlib.h>/* For yylex */
       #include <ctype.h> /* For yylex */
       #include <math.h>  /* For math functions, cos(), sin(), etc.  */
       #include "mfcalc.h"  /* Contains definition of `symrec'.  */
       int yylex (void);
       void yyerror (char const *);
     %}
     %union {
       double    val;   /* For returning numbers.  */
       symrec  *tptr;   /* For returning symbol-table pointers.  */
     }
     %token <val>  NUM        /* Simple double precision number.  */
     %token <tptr> VAR FNCT   /* Variable and Function.  */
     %type  <val>  exp
     
     %right '='
     %left '-' '+'
     %left '*' '/'
     %left NEG     /* negation--unary minus */
     %right '^'    /* exponentiation */

     %% /* The grammar follows.  */
     input:   /* empty */
             | input line
     ;
     
     line:
               '\n'
             | exp '\n'   { printf ("\t%.10g\n", $1); }
             | error '\n' { yyerrok;                  }
     ;
     
     exp:      NUM                { $$ = $1;                         }
             | VAR                { $$ = $1->value.var;              }
             | VAR '=' exp        { $$ = $3; $1->value.var = $3;     }
             | FNCT '(' exp ')'   { $$ = (*($1->value.fnctptr))($3); }
             | exp '+' exp        { $$ = $1 + $3;                    }
             | exp '-' exp        { $$ = $1 - $3;                    }
             | exp '*' exp        { $$ = $1 * $3;                    }
             | exp '/' exp        { $$ = $1 / $3;                    }
             | '-' exp  %prec NEG { $$ = -$2;                        }
             | exp '^' exp        { $$ = pow ($1, $3);               }
             | '(' exp ')'        { $$ = $2;                         }
     ;
     /* End of grammar.  */
     %%
     
     /* Called by yyparse on error.  */
     void yyerror (char const *s)
     {
       printf ("%s\n", s);
     }
     
     struct init
     {
       char const *fname;
       double (*fnct) (double);
     };
     
     struct init const arith_fncts[] =
     {
       "sin",  sin,
       "cos",  cos,
       "atan", atan,
       "ln",   log,
       "exp",  exp,
       "sqrt", sqrt,
       0, 0
     };
     
     /* The symbol table: a chain of `struct symrec'.  */
     symrec *sym_table;
     
     /* Put arithmetic functions in table.  */
     void init_table (void)
     {
       int i;
       symrec *ptr;
       for (i = 0; arith_fncts[i].fname != 0; i++)
         {
           ptr = putsym (arith_fncts[i].fname, FNCT);
           ptr->value.fnctptr = arith_fncts[i].fnct;
         }
     }
     
     int main (void)
     {
       init_table ();
       return yyparse ();
     }
     
     int yylex (void)
     {
       int c;
     
       /* Ignore white space, get first nonwhite character.  */
       while ((c = getchar ()) == ' ' || c == '\t');
     
       if (c == EOF)
         return 0;
     
       /* Char starts a number => parse the number.         */
       if (c == '.' || isdigit (c))
         {
           ungetc (c, stdin);
           scanf ("%lf", &yylval.val);
           return NUM;
         }
     
       /* Char starts an identifier => read the name.       */
       if (isalpha (c))
         {
           symrec *s;
           static char *symbuf = 0;
           static int length = 0;
           int i;
     
           /* Initially make the buffer long enough
              for a 40-character symbol name.  */
           if (length == 0)
             length = 40, symbuf = (char *)malloc (length + 1);
     
           i = 0;
           do
             {
               /* If buffer is full, make it bigger.        */
               if (i == length)
                 {
                   length *= 2;
                   symbuf = (char *) realloc (symbuf, length + 1);
                 }
               /* Add this character to the buffer.         */
               symbuf[i++] = c;
               /* Get another character.                    */
               c = getchar ();
             }
           while (isalnum (c));
     
           ungetc (c, stdin);
           symbuf[i] = '\0';
     
           s = getsym (symbuf);
           if (s == 0)
             s = putsym (symbuf, VAR);
           yylval.tptr = s;
           return s->type;
         }
     
       /* Any other character is a token by itself.        */
       return c;
     }

