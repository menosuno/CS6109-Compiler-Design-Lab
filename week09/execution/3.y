%{
	#include <stdio.h>
	#include <stdlib.h>
%}

%token ID NUM FOR LE GE EQ NE OR AND DTYPE PRINTF
%right "=" %left OR AND
%left '>' '<' LE GE EQ NE DTYPE PRINTF
%left '+' '-' %left '*' '/'
%right UMINUS
%right '!' 

%%
S : ST {printf("Input accepted\n"); return 0;}
ST : FOR '('DTYPE E ';' E2 ';' E ')' DEF
;
DEF : '{' BODY '}' | E';' |
;
BODY : BODY BODY
| E1 ';' |
;
E : ID '=' E
| E '+' E
| E '-' E
| E '*' E
| E '/' E
| E '+' '+' | E '-' '-' | ID
| NUM
;
E1 : ID '=' E3
| PRINTF
;
E3 : E3 '+' E3
| E3 '-' E3
| E3 '*' E3
| E3 '/' E3
| E3 '+' '+' | E3 '-' '-' | E3 LE E3
| E3 GE E3
| E3 EQ E3
| E3 NE E3
| E3 OR E3
| E3 AND E3
| ID
| NUM
;
E2 : E'<'E
| E'>'E
| E LE E
| E GE E
| E EQ E
| E NE E
| E OR E
| E AND E
;
%%

int main() {
	printf("Enter the expression:\n");
	yyparse();
	return 0;
}

yyerror() {
	printf("For invalid\n");
}
