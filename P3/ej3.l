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
