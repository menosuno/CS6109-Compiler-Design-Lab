%{
	#include<stdio.h>
	#include<stdlib.h>
	int yylex(void);
	int yyerror(const char *s);
	extern int yylex();
%}

%token IF ELSE BOOL_EXPR THEN STATEMENT SEMI

%% 
start:
stmt SEMI {printf("VALID IF ELSE STATEMENT!\n");}
;
stmt :
IF expr THEN stmt {;}
| IF expr THEN stmt ELSE stmt {;}
| STATEMENT {;}
;
expr :
BOOL_EXPR {;}
;
%%

int yyerror(const char *s) {
	fprintf(stderr, "%s\n", s);
}
int main() {
	yyparse();
	return 0;
}
