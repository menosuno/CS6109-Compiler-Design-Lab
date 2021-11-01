%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "y.tab.h"
	int yylex();
	void yyerror(char *err);
%}

%token IDENTIFIER
%token INTEGER

%%
output: E '\n' { printf("Valid Infix Expression!\n\n"); return 0; }
;
E : E '+' T
| E '-' T
| T
;
T : T '*' F
| T '/' F
| F
;
F : '(' E ')'
| IDENTIFIER
| INTEGER
;
%%

int main() {
	while (1) {
		yyparse();
	}
}
void yyerror(char *err) {
	printf("Invalid Infix Expression!\n");
	exit(1);
}
