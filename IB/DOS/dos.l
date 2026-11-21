/* Declaraciones */
%{
#include <stdio.h>
%}
/* Reglas */
%%
pare    printf("Comando pare recibido\n");
inicio  printf("Comando inicio ejecutado\n");
%%
/* Codigo (main) */
int main()
{
    yylex();
    return 0;
}
