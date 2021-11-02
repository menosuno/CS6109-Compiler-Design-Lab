%{
	#include<stdio.h>
	int flag=0;
%}

%token NUMBER AND OR
%left '!' AND OR

%%
booleanExpression: E{
	printf("Result: %d\n", $$);
	return 0;
};
E :E AND E {$$ = $1 && $3;}
|E OR E {$$ = $1 || $3;}
|'!'E {$$ = !$2;}
|NUMBER {$$ = $1;}
;
%%

void main() {
	printf("Enter the Boolean Expression:");
	yyparse();
	if(flag == 0)
		printf("\nThe entered Boolean Expression is Valid\n");
}

int yyerror() {
	printf("\nThe entered Boolean Expression is Invalid\n");
	flag = 1;
	return 1;
}