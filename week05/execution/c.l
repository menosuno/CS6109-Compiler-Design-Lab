%option noyywrap
%{
	#include <stdio.h>
%}

%%
[a-z]+ {
	fprintf(yyout, "\nLower = ");ECHO;
	yyless(3);
	fprintf(yyout, "\nThe word after yyless() = ");ECHO;
}
[a-zA-Z]+ {
	fprintf(yyout, "\nMixed letter is = ");ECHO;
}
%%

int main() {
	extern FILE *yyin, *yyout;
	yyin = fopen("input_c.txt", "r");
	yyout = fopen("output_c.txt", "w");
	yylex();
	return 0;
}
