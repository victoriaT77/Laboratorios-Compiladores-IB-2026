%{
#include <stdio.h>
%}
%%
"if"|"else"|"while"|"int"   { printf("PALABRA RESERVADA: %s\n", yytext); }
[a-zA-Z][a-zA-Z0-9]*        { printf("IDENTIFICADOR: %s\n", yytext); }
[0-9]+                      { printf("NUMERO ENTERO: %s\n", yytext); }
[ \t\n]+                    { /* ignorar espacios y saltos */ }
.                           { printf("DESCONOCIDO: %s\n", yytext); }
%%
int main()
{
    yylex();
    return 0;
}
