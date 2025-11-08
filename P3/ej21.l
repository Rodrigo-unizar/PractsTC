/* calcMejor.l fichero para la practica 3 de Teoria de la Computacion */
%{
#include "y.tab.h"
	int base = 10; //por defecto
%}
%%
"b="(10|[2-9]) {base = atoi(yytext+2); return(BASE);} //ignora "b=" y nos quedamos con la base
"+"	{return(ADD);}
"-"	{return(SUB);}
"*"	{return(MUL);}
"/"	{return(DIV);}
"("	{return(OP);}
")"	{return(CP);}
[0-9]+	{yylval = atoi(yytext); return(NUMBER);}
[0-9]+b {yylval = strtol(yytext,NULL,base); return(B_NUM);} //lee la expresion y la pasa auto. a la base actual
\n	{return(EOL);}
[ \t]	{/* ignorar espacios */}
.	{return(yytext[0]); /* caracter inesperado */}
%%
