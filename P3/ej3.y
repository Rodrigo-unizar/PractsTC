%{
#include <stdio.h>
extern int yylex();
extern int yyerror();
%}
%token S B C X Y Z EOL
%%

S : EOL
	| C X S EOL
	;
B :  X C Y Z Y EOL
    | X C EOL
	;
C : X B X EOL
    | Z EOL
%%
int yyerror(char* s) {
   printf("\n%s\n", s);
   return 0;
}
int main() {
  yyparse();
}

