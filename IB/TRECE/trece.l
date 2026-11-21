%{
#include <stdio.h>
%}
%%
[a-zA-Z_][a-zA-Z0-9_]*   { printf("IDENTIFICADOR: %s\n", yytext); }
[0-9]+                   { printf("ENTERO: %s\n", yytext); }
","                      { printf("SEPARADOR: ,\n"); }
[ \t\n]+                 { /* ignorar espacios y saltos de linea */ }
[^, \t\n]+               { printf("ERROR LEXICO: %s\n", yytext); }
%%
int main()
{
    yylex();
    return 0;
}
