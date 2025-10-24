%%
rtr((v|Vt)r)*tV((R|rtr((v|Vt)r)*t)V)*tr((v|Vtr((v|Vt)r)*tV((R|rtr((v|Vt)r)*t)V)*t)r)*t(r((v|(V|tV(RV)*(r|tr(vr)*V))tr((v|Vt)r)*tV((R|rtr((v|Vt)r)*t)V)*tr((v|Vtr((v|Vt)r)*tV((R|rtr((v|Vt)r)*t)V)*t)r)*t)r)*(v|(V|tV(RV)*(r|tr(vr)*V))tr((v|Vt)r)*tV((R|rtr((v|Vt)r)*t)V)*tr((v|Vtr((v|Vt)r)*tV((R|rtr((v|Vt)r)*t)V)*t)r)*t)?)? {printf("--%s", yytext);}

RTv((r|RT)v)*TR[VR]*T(v(r|R|Tv[rv]*R|Tv[rv]*TR[VR]*(v|Tv[rv]*R))Tv((r|RT)v)*TR[VR]*T)*(v)? {printf("++%s", yytext);}

.* {printf("**%s", yytext);}

%%
