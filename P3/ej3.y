 //Autores: Razvan Ghita Calangiu 927460 ; Rodrigo Herce Alonso 935413
%{
#include <stdio.h>
extern int yylex();
extern int yyerror();
%}
%token X Y Z EOL
%start inicio
%%
inicio:  /* nada */
	| inicio S EOL
	;

S : 	/*nada */
	| C X S
	;

B : X C
    | X C Y Z Y
    ;

C : X B X
    | Z
    ;
%%
int yyerror(char* s) {
   printf("\n%s\n", s);
   return 0;
}
int main() {
  yyparse();
}

