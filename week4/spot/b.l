%option noyywrap
%{
    #include<stdio.h>
%}

%%
[ab]*(abb)+[ab]*    {printf("%s.\nContains abb. Not matched.\n", yytext);}
[ab]*		    {printf("%s.\nDoesnt contain \'abb\'. String matched.\n", yytext);}
.*		    {printf("%s.\nInvalid\n", yytext);}
%%

int main()
{
    yyin = fopen("file2.txt","r");
    printf("Strings from file2.txt:\n");
    yylex();
    return 0;
}
