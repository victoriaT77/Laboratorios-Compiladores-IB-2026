%{
#include <stdio.h>

int contador[10] = {0};
%}

%%

[0-9] {
	contador[yytext[0] - '0']++;
}

.|\n {
	/* Ignorar otros caracteres */
}

%%

int main()
{
	yylex();
	
	printf("\nFRECUENCIA DE DIGITOS\n");
	printf("Digito\tCantidad\n");

	for(int i = 0; i < 10; i++){
		printf("%d\t%d\n", i, contador[i]);
	}

	return 0;
}
