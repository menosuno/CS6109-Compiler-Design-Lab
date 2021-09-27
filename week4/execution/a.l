%option noyywrap
%{
#include <stdio.h>
%}

%%
[a-zA-Z0-9]+ { printf("%s\n",yytext);}
.|\n
%%

int main() 
{
	yyin = fopen("file1.txt","r");
	printf("Required Strings:\n");
	yylex();
	return 0;
}
