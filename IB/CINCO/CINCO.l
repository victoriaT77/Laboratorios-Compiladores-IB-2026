%{
#include <stdio.h>

int mayusculas = 0;
int minusculas = 0;
int digitos = 0;
int espacios = 0;
%}

%%

[A-Z]	{ mayusculas++; }
[a-z]   { minusculas++; }
[0-9]   { digitos++; }
[ \t\n\r]   { espacios++; }

.	{/* Ignora otros caracteres */}

%%

int main()
{
	yylex();

	printf("\nRESULTADOS\n");
        printf("Mayusculas: %d\n", mayusculas);
        printf("Minusculas: %d\n", minusculas);
        printf("Digitos: %d\n", digitos);
        printf("Espacios en blanco: %d\n", espacios);

	return 0;
}
