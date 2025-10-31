%%
^RTvTRT(v(r|RTvTRT))*(v)?$ {printf("++%s", yytext);}

^rtrtVtrt(r(v|rtrtVtrt))*(r)?$ {printf("--%s", yytext);}

.* {printf("**%s", yytext);}

%%
