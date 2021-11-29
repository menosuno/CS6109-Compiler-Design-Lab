%option noyywrap
%{
	#include<stdio.h>
%}

%%
^[b-df-hj-np-tv-z]*a[a-df-hj-np-tv-z]*e[b-hj-np-tv-z]*i[b-df-np-tv-z]*o[b-df-hj-tv-z]*u[b-df-hj-np-z]*$ {printf("String %s contains all vowels in order..\n",yytext);}
.* {printf("Doesn't satisfy the given condition..\n");}
%%
int main()
{
	yylex();
	return 0;
}

