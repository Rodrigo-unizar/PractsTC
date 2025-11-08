 //Autores: Razvan Ghita Calangiu 927460 ; Rodrigo Herce Alonso 935413
/* ej22.l fichero para la practica 3 de Teoria de la Computacion */
%{
#include "y.tab.h"
	int base = 10; //por defecto
%}
%%
"b="[ ]*(10|[2-9]) {int i = 0; while(yytext[i] != '='){i++;} base = atoi(&yytext[i+1]); return(BASE);} //unicamente nos quedamos con la base e ignoramos el resto
"+"	{return(ADD);}
"-"	{return(SUB);}
"*"	{return(MUL);}
"/"	{return(DIV);}
"("	{return(OP);}
")"	{return(CP);}
";"	{return(PC);}
";b"	{return(PCB);}
[0-9]+	{yylval = atoi(yytext); return(NUMBER);}
\n	{return(EOL);}
[ \t]	{/* ignorar espacios */}
.	{return(yytext[0]); /* caracter inesperado */}
%%
