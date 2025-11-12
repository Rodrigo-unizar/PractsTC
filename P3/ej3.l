 //Autores: Razvan Ghita Calangiu 927460 ; Rodrigo Herce Alonso 935413
%{
#include "y.tab.h"
%}
%%
"x"    { return(X); }
"y"    { return(Y); }
"z"    { return(Z); }
\n     { return EOL; }
[ \t]  { /* ignorar espacios */ }
.      { return yytext[0]; /* caracter inesperado */ }
%%
