%{
#include <stdio.h>
%}

%%

"+"	{ printf("Operador aritmetico: %s\n", yytext); }
"-"     { printf("Operador aritmetico: %s\n", yytext); }
"*"     { printf("Operador aritmetico: %s\n", yytext); }
"/"     { printf("Operador aritmetico: %s\n", yytext); }


"<="     { printf("Operador relacional: %s\n", yytext); }
">="     { printf("Operador relacional: %s\n", yytext); }
"=="     { printf("Operador relacional: %s\n", yytext); }
"!="     { printf("Operador relacional: %s\n", yytext); }
"<"     { printf("Operador relacional: %s\n", yytext); }
">"     { printf("Operador relacional: %s\n", yytext); }

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
