 //Autores: Razvan Ghita Calangiu 927460 ; Rodrigo Herce Alonso 935413
/* ej22.y fichero para la practica 3 de Teoria de la Computacion  */
%{
#include <stdio.h>
extern int yylex();
extern int yyerror();
extern int base;
%}
%token NUMBER EOL CP OP BASE PC PCB
%start calclist
%token ADD SUB
%token MUL DIV
%%

calclist : /* nada */
	| calclist exp PC EOL { printf("=%d\n", $2); }
	| calclist exp PCB EOL { int num = $2; int cadena[64]; int contador = 0; int signo = 0; int resul = 0;
				 printf("=");
				 if(num == 0){printf("%d", num);}
                                 if(num < 0){printf("-"); num = -num;}
                                 while (num > 0) {
                                        resul = (num % base);
					cadena[contador] = resul;
					num = num / base;
                                        contador++;
                                }

				for (int i = contador - 1; i >= 0; i--) {
        				printf("%d", cadena[i]);
    				}
                                printf("\n");
			}
	|calclist BASE EOL
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

