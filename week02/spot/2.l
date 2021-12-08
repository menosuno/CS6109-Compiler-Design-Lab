%option noyywrap

vowels [aeiouAEIOU]
consonants [^aeiouAEIOU\t\n \,\.\d]

%{
	#include <stdio.h>
	int vc = 0, cc = 0;
%}

%%
{vowels} { 
	vc++;
}
{consonants} {
	cc++;
}
%%

int main() {
	printf("Enter a string : ");
	yylex();
	printf("\nVowels count : %d \n Consonants count : %d\n", vc, cc);
	return 0;
}
