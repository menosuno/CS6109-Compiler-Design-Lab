%option noyywrap
%{
    #include <stdio.h>
%}

%%
[^abcABC] { printf("%s",yytext); }
.|\n {;}
%%

int main() {
    yyin = fopen("file4.txt","r");
    printf("Required Strings:\n");
    yylex();
    printf("\n");
    return 0;
}
