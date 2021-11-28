%{
	#include<stdio.h>
	#include<stdlib.h>
	int yylex(void);
	int yyerror(const char *s);
	extern int yylex();
%}

%token ID NUM OR AND NOT DOUBLE_EQUALS IF SEMI OPEN CLOSE
%left OR AND
%left NOT

%% 
single_if_stmt :
IF bool_expr bool_expr SEMI {printf("VALID IF STATEMENT");}
;
bool_expr :
OPEN bool_expr CLOSE {printf("VALID BOOLEAN EXPRESSION !\n");}
| ID AND bool_expr {;}
| ID OR bool_expr {;}
| ID DOUBLE_EQUALS NUM {;}
| ID DOUBLE_EQUALS bool_expr {;}
| NOT bool_expr {;}
| ID {;}
;
%%

int yyerror(const char *s) {
	fprintf(stderr, "%s\n", s);
}

int main() {
	yyparse();
	return 0;
}
