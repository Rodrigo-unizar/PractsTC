 //Autores: Razvan Ghita Calangiu 927460 ; Rodrigo Herce Alonso 935413
/* ej23.l fichero para la practica 3 de Teoria de la Computacion */
%{
#include "y.tab.h"
%}
%%
"+"	{return(ADD);}
"-"	{return(SUB);}
"*"	{return(MUL);}
"/"	{return(DIV);}
"("	{return(OP);}
")"	{return(CP);}
[0-9]+	{yylval = atoi(yytext); return(NUMBER);}
[A-F0-9]+"H" {
	int num = 0; int valor = 0; char leido;
	int longitud = yyleng - 1;
	for(int i = 0; i < longitud; i++){
		leido = yytext[i];
		if(leido >= '0' && leido <= '9'){
			valor = leido - '0';
		} else {
			valor = leido - 55;
		}
		num = (16* num) + valor;
	}
	yylval = num;
	 return(HEXA);}
\n	{return(EOL);}
[ \t]	{/* ignorar espacios */}
.	{return(yytext[0]); /* caracter inesperado */}
%%
