%option noyywrap
%{
	#include <stdio.h>
	#include <string.h>
%}

%%
[+] { fprintf(yyout, "||"); }
[*] { fprintf(yyout, "&&"); }
[a-z]  { fprintf(yyout, yytext); }
\n { fprintf(yyout, "\n"); } ;
%%

int main() {
	extern FILE *yyin,*yyout;
	yyin = fopen("input2.txt","r");
	yyout = fopen("output2.txt","w");
	yylex();
	return 0;
}
