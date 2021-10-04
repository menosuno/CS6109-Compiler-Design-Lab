%option noyywrap
%{
	#include <stdio.h>
%}

%%
[a-z]+ {
	fprintf(yyout, "\nLowercase letter = ");ECHO;
	fprintf(yyout, "\nStart of 1st yymore\n");ECHO;
	yymore();
	fprintf(yyout, "\nEnd of 1st yymore\n");ECHO;
}

[A-Z]+ {
	fprintf(yyout, "\nUppercase letter = ");ECHO;
	fprintf(yyout, "\nStart of 2nd yymore\n");ECHO;
	yymore();
	fprintf(yyout, "\nEnd of 2nd yymore\n");ECHO;
}
%%

int main() {
	extern FILE *yyin, *yyout;
	yyin = fopen("input_d.txt", "r");
	yyout = fopen("output_d.txt", "w");
	yylex();
	return 0;
}