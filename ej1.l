%x comentarios_a
%x comentarios_b

%{
 //Autores: Razvan Ghita Calangiu   NIP:927460 ; Rodrigo Herce Alonso   NIP:935413
 #include <stdio.h>
 #include <stdbool.h>
        bool encontrado = false;
%}
%%

\/\/ {BEGIN(comentarios_b);}
\/\* {BEGIN(comentarios_a);}
\/\/ups {encontrado = true; BEGIN(comentarios_b);}

<comentarios_b>[^a-zA-Z0-9]"ups"[^a-zA-Z0-9\n]|[^a-zA-Z0-9]"ups"$ {encontrado = true; printf("%s", yytext);}
<comentarios_b>\n  {if(encontrado){encontrado = false; printf("NO ACTUALIZADO%s", yytext);} else{printf("%s", yytext);} BEGIN(INITIAL);}
<comentarios_b>. {printf("%s", yytext);}

<comentarios_a>"*/"  {if(encontrado){encontrado = false; printf("NO ACTUALIZADO%s", yytext);} else{printf("%s", yytext);} BEGIN(INITIAL);}
<comentarios_a>[^a-zA-Z0-9]"ups"[^a-zA-Z0-9] {encontrado = true; printf("%s", yytext);}
<comentarios_a>\n {printf("%s", yytext);}
<comentarios_a>. {printf("%s", yytext);}

\n      {printf("%s", yytext);}
.       {printf("%s", yytext);}

%%

int main(){
        int error = yylex();
        return 0;
}
