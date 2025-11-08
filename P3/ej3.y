%{
#include <stdio.h>
extern int yylex();
extern int yyerror();
%}
%token X Y Z EOL
%start S 
%%

S : EOL
	| C X S EOL
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

