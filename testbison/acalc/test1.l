%{
#include <stdio.h>
%}
%%
[0123456789]+    printf("NUMBER");
[a-zA-Z]+        {
                   printf("WO");
                   printf("RD");
                 }
%%
