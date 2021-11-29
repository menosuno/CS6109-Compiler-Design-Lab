%option noyywrap
%{
    #include<stdio.h>
    int count = 0;
%}

%%
[ab]*b+[ab]*b+[ab]* {printf("%s\nContains at least 2 b's. String matched.\n", yytext);}
[ab]*		    {printf("%s\nString not matched.\n", yytext);}
.*		    {printf("%s\nInvalid\n", yytext);}
%%

int main()
{
    yyin = fopen("file3.txt","r");
    printf("Strings from file3.txt:\n");
    yylex();
    return 0;
}
