%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "y.tab.h"
	int yylex();
	void yyerror(char *err);
%}

%token DATA_TYPE
%token IDENTIFIER
%token INTEGER
%token CMPD_ASSIGNMENT_OP
%token REL_OP
%token FOR_IDENT

%%
OUTPUT : FOR { printf("Valid Nested For Loop!\n\n"); return 0; }
;
STMTS : STMTS STMT '\n'
| STMTS '\n'
| /* Epsilon */
;
STMT : ASSIGNMENT';'
| INCREMENT';'
| FOR
| ';'
;
ASSIGNMENT : IDENTIFIER '=' E
| IDENTIFIER CMPD_ASSIGNMENT_OP E
;
INCREMENT : IDENTIFIER'+''+'
| IDENTIFIER'-''-'
| '+''+'IDENTIFIER
| '-''-'IDENTIFIER
;
FOR : FOR_IDENT '(' FOR_RULES ')' '{' STMTS '}'
;
FOR_RULES : FOR_INIT';' FOR_COND';' FOR_ITER
;
FOR_INIT : DATA_TYPE IDENTIFIER '=' E
| /* Epsilon */
;
FOR_COND : IDENTIFIER REL_OP E
| /* Epsilon */
;
FOR_ITER : INCREMENT
| IDENTIFIER CMPD_ASSIGNMENT_OP E
| /* Epsilon */
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
	yyparse();
}

void yyerror(char *err) {
	printf("Invalid Nested for loop\n");
	exit(1);
}