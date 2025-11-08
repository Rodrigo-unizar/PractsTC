 //Autores: Razvan Ghita Calangiu 927460 ; Rodrigo Herce Alonso 935413
/* ej24.y fichero para la practica 3 de Teoria de la Computacion  */
%{
#include <stdio.h>
extern int yylex();
extern int yyerror();
%}
%token NUMBER EOL CP OP PC PCH
%start calclist
%token ADD SUB
%token MUL DIV
%%

calclist : /* nada */
	| calclist exp PC EOL { printf("=%d\n", $2); }
	| calclist exp PCH EOL { int num = $2; char hexa[64]; int contador = 0; int resto = 0; int signo = 0;
				 if(num < 0){signo = 1; num = -num;}
				 while (num > 0) {
      				 	resto = num % 16; // Obtenemos el resto de dividir por 16

        				//convertimos el resto (0-15) a un carácter (0-9, A-F)
        				if (resto < 10) {
						hexa[contador] = resto + '0';
        				} else {
        					hexa[contador] = resto + 55;
        				}

        				num = num / 16; // Actualizamos el número al cociente
        				contador++; // Movemos el índice
    				}
				printf("=");
				if(signo){printf("-");}
				for (int i = contador - 1; i >= 0; i--) {
     					   printf("%c", hexa[i]);
    				}
				printf("\n");

			 }
	;
exp : 	factor
	| exp ADD factor { $$ = $1 + $3; }
	| exp SUB factor { $$ = $1 - $3; }	
	;
factor : 	factor MUL factorsimple { $$ = $1 * $3; }
		| factor DIV factorsimple { $$ = $1 / $3; }
		| factorsimple
		;
factorsimple : 	OP exp CP { $$ = $2; }
		| NUMBER 
		;
%%
int yyerror(char* s) {
   printf("\n%s\n", s);
   return 0;
}
int main() {
  yyparse();
}

