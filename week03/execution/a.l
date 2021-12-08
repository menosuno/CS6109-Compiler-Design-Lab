%option noyywrap
%{
	#include <stdio.h>
%}

%%
\/\*([^*"]*|".*"|\*+[^\/])*\*\/ {
	printf("String %s represents a comment..\n",yytext);
}
.* {
	printf("Doesn't satisfy the given condition..\n");
}
%%

int main() {
	yylex();
	return 0;
}

