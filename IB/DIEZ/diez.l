%{
#include <stdio.h>
%}
%%
[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}   { printf("CORREO VALIDO (TOKEN_EMAIL): %s\n", yytext); }
[ \t\n]+                                       { /* ignorar espacios y saltos de linea */ }
[^ \t\n]+                                      { printf("NO VALIDO: %s\n", yytext); }
%%
int main()
{
    yylex();
    return 0;
}
