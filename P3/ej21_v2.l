/* calcMejor.l fichero para la practica 3 de Teoria de la Computacion */
%{
#include "y.tab.h"
	int base = 10; //por defecto
%}
%%
"b="[ ]*(10|[2-9]) {base = atoi(&yytext[yyleng-2]); return(BASE);} //ignora "b=" y nos quedamos con la base
"+"	{return(ADD);}
"-"	{return(SUB);}
"*"	{return(MUL);}
"/"	{return(DIV);}
"("	{return(OP);}
")"	{return(CP);}
[0-9]+	{yylval = atoi(yytext); return(NUMBER);}
[0-9]+b {
	int resultado = 0;
	int num = 0;
	for (int i = 0; yytext[i] != 'b'; i++) {

        //convierte el caracter en entero
        if (yytext[i] >= '0' && yytext[i] <= '9') {
            num = yytext[i] - '0';
        }

        resultado = (resultado * base) + num;
    }

    yylval = resultado;

	return(B_NUM);}
\n	{return(EOL);}
[ \t]	{/* ignorar espacios */}
.	{return(yytext[0]); /* caracter inesperado */}
%%
