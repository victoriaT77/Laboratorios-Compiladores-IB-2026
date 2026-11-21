%{
#include <stdio.h>
#include <stdlib.h>
%}
%%
0[xX][0-9a-fA-F]+   { printf("Hexadecimal: %s -> Decimal: %ld\n", yytext, strtol(yytext, NULL, 16)); }
[ \t\n]+            { /* ignorar espacios y saltos de linea */ }
[^ \t\n]+           { printf("No es hexadecimal: %s\n", yytext); }
%%
int main()
{
    yylex();
    return 0;
}
