%{
	#include<stdio.h>
	#include<ctype.h>
	int yylex();
	int yyerror();
%}

%token DIGIT
%left '&''|'
%right '!'

%%
line : expression '\n' {printf("answer = %d\n\n",(int)$$); return 0;}
	 ;
expression : expression '&' '&' expression {$$ = $1 && $4;}
		   | expression '|' '|' expression {$$ = $1 || $4;}
		   | '!' expression {$$ = !$2;}
		   | '(' expression ')' {$$ = $2;}
		   | DIGIT      {$$ = $1;}
		   ;
%%

#include "lex.yy.c"

int main() {
	while(1)
		yyparse();
}

int yyerror() {}
