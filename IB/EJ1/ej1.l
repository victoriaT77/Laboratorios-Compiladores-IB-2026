%{
#include <stdio.h>
int mayus = 0, minus = 0, digitos = 0, espacios = 0;
%}
%%
[A-Z]       { mayus++; }
[a-z]       { minus++; }
[0-9]       { digitos++; }
[ \t]       { espacios++; }
\n          { /* ignorar salto de linea */ }
.           { /* ignorar otros simbolos */ }
%%
int main()
{
    yylex();
    printf("\nMayusculas: %d\n", mayus);
    printf("Minusculas: %d\n", minus);
    printf("Digitos: %d\n", digitos);
    printf("Espacios en blanco: %d\n", espacios);
    return 0;
}
