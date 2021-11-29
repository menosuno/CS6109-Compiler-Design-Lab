%option noyywrap
%{
	#include<stdio.h>
	int flag = 0;
%}

%%
^d.*t$ { flag = 1; }
\n { return 0; }
%%

int main()
{
	yylex();
	if(flag)
		printf("Pattern matched.\n");
	else
		printf("Pattern not matched.\n");
	return 0;
}
