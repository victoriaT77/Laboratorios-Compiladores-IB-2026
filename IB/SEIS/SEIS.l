%{
#include <stdio.h>
%}

%%

"if"	{ printf("Palabra reservada: %s\n", yytext); }
"else"    { printf("Palabra reservada: %s\n", yytext); }
"while"    { printf("Palabra reservada: %s\n", yytext); }
"int"    { printf("Palabra reservada: %s\n", yytext); }

[a-zA-Z_][a-zA-Z0-9_]* {
	printf("Identificador: %s\n", yytext);
}

[0-9]+ {
	printf("Numero entero: %s\n", yytext);
}

[ \t\n\r]+ {/*Ignorar espacios*/}

. {
	printf("Caracter no reconocido: %s\n", yytext);
}

%%

int main()
{
	yylex();
	return 0;
}
