%option noyywrap
%{
    #include <stdio.h>
%}

%%
^b(an){1,2}a?$ {printf("Matched");}
.* {printf("Not matched");}
%%

int main() {
    yyin = fopen("file2.txt","r");
    printf("Required Strings:\n");
    yylex();
    return 0;
}
