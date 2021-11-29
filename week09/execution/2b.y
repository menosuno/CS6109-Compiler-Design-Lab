%{
	#include<stdio.h>
	int count = 0;
%}

%token NUMBER
%left '+' '-' %left '*' '/' 

%%
state : exp {count++;}
;
exp : NUMBER
| exp exp'+' {}
| exp exp'-' {}
| exp exp'*' {}
| exp exp'/' {}
| '('exp')' {}
;
%%

int yyerror() {
	printf("Invalid Postfix Expression.!");
	count = 0;
	return 1;
}

int main() {
	printf("Enter the Expression:");
	yyparse();
	if(count > 0)
		printf("Valid Postfix Expression.!");
	return 0;
}
