%option noyywrap
%{
	#include <stdio.h>
	#include <stdlib.h>
	int count[10] = {0,0,0,0,0,0,0,0,0,0};
	int valid = 1;
%}

%%
[0-9] {count[atoi(yytext)]++;}
\n {return 0;}
. {valid = 0; return 0;}
%%

int main() {
	yylex();
	if(valid == 0)
		printf("Invalid entry\n");
	else {
		int repititions = 0;
		for(int i = 0; i < 10; ++i) {
			if(count[i] > 1) { 
				++repititions;
			}
		}
		if(repititions > 1) 
			printf("Doesn't satisfy the given condition..\n");	
		else
			printf("Contains atmost one repetitive digit..\n",yytext);
	}
	return 0;
}

