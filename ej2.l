%%
RTv((r|RT)v)*TR[VR]*T(v(r|R|Tv[rv]*R|Tv[rv]*TR[VR]*(v|Tv[rv]*R))Tv((r|RT)v)*TR[VR]*T)*(v)? {printf("++%s", yytext);}

.* {printf("**%s", yytext);}

%%
