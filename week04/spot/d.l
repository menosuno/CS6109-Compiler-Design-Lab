%option noyywrap
%{
    #include<stdio.h>
    int count = 0;
%}

%%
a*ba*ba* {printf("%s\nContains exactly 2 b's. String matched.\n", yytext);}
a*ba*		    {printf("%s\nContains one 'b'.\n", yytext);}
a*ba*ba*b+[ab]* {printf("%s\nContains more than 2 'b' s.\n",yytext);}
.*		    {printf("%s\nInvalid\n", yytext);}
%%

int main()
{
    yyin = fopen("file4.txt","r");
    printf("Strings from file4.txt:\n");
    yylex();
    return 0;
}
