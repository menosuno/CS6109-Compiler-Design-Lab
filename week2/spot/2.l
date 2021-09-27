%option noyywrap
%{
	#include<stdio.h>
	int vc = 0;
	int cc = 0;
%}

%%
[aeiou AEIOU] {vc++;}
[a-z A-Z] {cc++;}
%%

int main(){
	printf("Enter a string : ");
	yylex();
	printf("\n Vowels count : %d \n Consonants count : %d", vc, cc);
	return 0;
}