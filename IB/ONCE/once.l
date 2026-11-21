%{
#include <stdio.h>
#include <stdlib.h>
%}
%%
[01]+       { printf("Binario: %s -> Decimal: %ld\n", yytext, strtol(yytext, NULL, 2)); }
[ \t\n]+    { /* ignorar espacios y saltos de linea */ }
[^ \t\n]+   { printf("No es binario: %s\n", yytext); }
%%
int main()
{
    yylex();
    return 0;
}
