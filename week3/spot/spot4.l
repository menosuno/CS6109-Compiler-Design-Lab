%option noyywrap
%{
#include<stdio.h>
%}
%%
[a-z0-9]+ {printf("matching");}
[A-Za-z0-9]+   {printf("not matching");}
%%
main()
{
yylex();
return 0;
}
int yywrap()
{
}
