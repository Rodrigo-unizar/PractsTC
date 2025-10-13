%x comentarios_a
%x comentarios_b


%{
 //Autores: Razvan Ghita Calangiu   NIP:927460 ; Rodrigo Herce Alonso   NIP:935413
 #include <stdio.h>
 #include <stdbool.h>
 #include <string.h>
        bool encontrado = false;
        char p1[128], p2[128];

%}
%%

\/\/ {printf("%s", yytext); BEGIN(comentarios_b);}
\/\* {printf("%s", yytext); BEGIN(comentarios_a);}


\/\/ups {printf("%s", yytext); encontrado = true; BEGIN(comentarios_b);}
\/\*ups {printf("%s", yytext); encontrado = true; BEGIN(comentarios_a);}


ups[ ]*\([^,)]+,[^,)]+\) {
                                char copia[] = strdup(yytext);
                                int i = 3;
                                while(copia[i] != '('){
                                        i++;
                                }

                                int inicioP1 = i;
                                while(copia[i] != ','){
                                        i++;
                                }

                                copia[i] == '\0'; //cambio la ',' por un fin de cadena de caracteres

                                int inicioP2 = i = 1; 
                                while(copia[i] != ')'){
                                        i++;
                                }
                                copia[i] == '\0'; //cambio el ')' por un fin de cadena de caracteres

                                printf("ups(%s,%s)", copia[inicioP2], copia[inicioP1]);
                                }


\n      {printf("%s", yytext);}
.       {printf("%s", yytext);}


<comentarios_b>[^a-zA-Z0-9]"ups"[^a-zA-Z0-9\n]|[^a-zA-Z0-9]"ups"$ {encontrado = true; printf("%s", yytext);}
<comentarios_b>\n  {if(encontrado){encontrado = false; printf("NO ACTUALIZADO%s", yytext);}else{printf("%s", yytext);} BEGIN(INITIAL);}
<comentarios_b>. {printf("%s", yytext);}


<comentarios_a>"*/"  {if(encontrado){encontrado = false; printf("NO ACTUALIZADO%s", yytext);} else{printf("%s", yytext);} BEGIN(INITIAL);}
<comentarios_a>[^a-zA-Z0-9]"ups"[^a-zA-Z0-9\*]?     {encontrado = true; printf("%s", yytext);}
<comentarios_a>[^a-zA-Z0-9]"ups"[a-zA-Z0-9]*[^*/]   {encontrado = false; printf("%s", yytext);}
<comentarios_a>\n {printf("%s", yytext);}
<comentarios_a>. {printf("%s", yytext);}


%%

int main(){
        int error = yylex();
        return 0;
}

