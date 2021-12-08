%option noyywrap
%{
	#include <stdio.h>
%}

%%
[A-Za-z\d]+ {printf("%s\n",yytext);}
.|\n
%%

int main() {
	yyin = fopen("file1.txt","r");
	printf("Required Strings:\n");
	yylex();
	return 0;
}
