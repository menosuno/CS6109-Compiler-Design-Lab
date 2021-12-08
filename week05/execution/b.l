%option noyywrap 
%{
	#include <stdio.h>
	#include <string.h>

	char replace_with[] = "la";
	char replace[] = "el";
%}

%%
[a-zA-Z]+ {
	if (strcmp(yytext, replace) == 0) 
		fprintf(yyout, "%s", replace_with);
	else
		fprintf(yyout, "%s", yytext);
}
. fprintf(yyout, "%s", yytext);
%%

int main() {
	extern FILE *yyin, *yyout;
	yyin = fopen("input_b.txt", "r");
	yyout = fopen("output_b.txt", "w");
	yylex();
	return 0;
}
