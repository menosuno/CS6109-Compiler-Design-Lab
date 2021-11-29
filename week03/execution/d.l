%option noyywrap
%{
	#include<stdio.h>
%}

%%
[ab]*(abb)[ab]* {printf("Doesn't satisfy the given condition..\n");}
.* {printf("String %s doesnt contain abb..\n",yytext);}
%%
int main()
{
	yylex();
	return 0;
}

