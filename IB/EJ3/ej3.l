%{
#include <stdio.h>
%}
%%
"+"|"-"|"*"|"/"             { printf("OPERADOR ARITMETICO: %s\n", yytext); }
"<="|">="|"=="|"!="|"<"|">" { printf("OPERADOR RELACIONAL: %s\n", yytext); }
[ \t\n]+                    { /* ignorar espacios y saltos */ }
.                           { /* ignorar otros caracteres */ }
%%
int main()
{
    yylex();
    return 0;
}
