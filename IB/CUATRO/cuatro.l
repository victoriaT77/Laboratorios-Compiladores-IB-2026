%{
#include <stdlib.h>
#include <stdio.h>
%}
%%
[0-9]+                                          printf("NUMERO \n");
[+-]?[0-9]+(\.[0-9]+)?((E|e)[+-]?[0-9]+)?       printf("NUMERO REAL \n");
[a-zA-Z][a-zA-Z0-9]*                            printf("IDENTIFICADOR \n");
[ \t\n]+                                        /* ignorar espacios y saltos */
%%
int main()
{
    yylex();
    return 0;
}
