%option noyywrap
%{
#include<stdio.h>
%}
%%
(def) {printf("matching");}
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
