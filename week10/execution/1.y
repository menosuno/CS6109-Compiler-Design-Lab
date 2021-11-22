%{
	#include<stdio.h>
	int flag=1;
	int yylex();
	int yyerror();
%}

%token digit letter

%%
start : letter s
s : letter s
	| digit s
	|
	;
%%

int main() {
	printf("\nENTER A VARAIBLE NAME : ");
	yyparse();
	if(flag == 1) {
		printf("\nVALID VARAIABLE\n");
	}
}

int yyerror() {
	printf("\nINVALID VARAIABLE\n");
	flag = 0;
	return 0;
}
