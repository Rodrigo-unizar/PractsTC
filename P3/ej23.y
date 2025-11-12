 //Autores: Razvan Ghita Calangiu 927460 ; Rodrigo Herce Alonso 935413
/* ej23.y fichero para la practica 3 de Teoria de la Computacion  */
%{
#include <stdio.h>
extern int yylex();
extern int yyerror();
%}
%token NUMBER EOL CP OP HEXA
%start calclist
%token ADD SUB
%token MUL DIV
%%

calclist : /* nada */
	| calclist exp EOL { printf("=%d\n", $2);}
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
		| HEXA
		;
%%
int yyerror(char* s) {
   printf("\n%s\n", s);
   return 0;
}
int main() {
  yyparse();
}

