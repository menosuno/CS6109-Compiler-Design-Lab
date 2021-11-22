%{
	#include<stdio.h>
	int flag=0;
	int yylex();
	int yyerror();
%}

%token NUMBER LE GE EQ NE
%left '&' '|'
%right '!'
%left '>' '<' LE GE EQ NE

%%
result: E{
	printf(" Result=%d\n", $$);   
	if($$==1)
	printf("TRUE\n");
	else    
	printf("FALSE\n");
	return 0;
};
E: E1'>'E1 {$$=$1>$3;}
|E1'<'E1 {$$=$1<$3;}
|E1 GE E1 {$$=$1>=$3;}
|E1 LE E1 {$$=$1<=$3;}
|E1 EQ E1 {$$=$1==$3;}
|E1 NE E1 {$$=$1!=$3;}
E1: E1'&'E1 {$$=$1&$3;}
|E1'|'E1 {$$=$1|$3;}
|'!'E1 {$$=!$2;}
|NUMBER
;
%%

int main() {
	printf("Enter the Expression:");
	yyparse();
	if(flag == 0)
		printf("Entered expression is Valid");
}

int yyerror() {
	printf("Entered expression is Invalid");
	flag = 1;
	return 1;
}