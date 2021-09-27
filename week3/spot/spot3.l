%option noyywrap
%{
#include<stdio.h>
%}
%%
(ab)+ {printf("matching");}
.*    {printf("not matching");}
%%
main()
{
yylex();
return 0;
}
int yywrap()
{
}
