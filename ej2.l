%{
	//Autores: Razvan Ghita Calangiu NIP:927460 ; Rodrigo Herce Alonso NIP:935413 
%}
%%

^RTvTRT(v(r|RTvTRT))*(v)?$ {printf("++%s", yytext);}

^rtr((v|Vt)r)*tV((R|rtr((v|Vt)r)*t)V)*tr((v|Vtr((v|Vt)r)*tV((R|rtr((v|Vt)r)*t)V)*t)r)*t(r(v|(V|tV(RV)*(r|tr(vr)*V))tr((v|Vt)r)*tV((R|rtr((v|Vt)r)*t)V)*tr((v|Vtr((v|Vt)r)*tV((R|rtr((v|Vt)r)*t)V)*t)r)*t))*(r)? {printf("--%s", yytext);}

.* {printf("**%s", yytext);}

%%
