%option noyywrap

vowels [aeiouAEIOU]

%{
	#include <stdio.h>
	int vc = 0, cc = 0;
%}

%%
{vowels} { 
	vc++;
}
[^{vowels}] {
	cc++;
}
%%

int main() {
	printf("Enter a string : ");
	yylex();
	printf("\nVowels count : %d \n Consonants count : %d\n", vc, cc);
	return 0;
}
