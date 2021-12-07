%option noyywrap
%{
	#include <stdio.h>
	int keyword = 0, identifier = 0, number = 0;
	int unsigned_number = 0, delimiter = 0, assignment_operator = 0;
	int operator = 0, special_character = 0;
%}

%%
if|then|else|for|while|int|float|real {keyword++;}
[a-z]+([a-z]|[0-9])* {identifier++;}
[0-9]* {number++;}
[0-9]+(.[0-9]+)?(E[+|-]?[0-9])? {unsigned_number++;}
[\n \t] {delimiter++;}
= {assignment_operator++;}
"+"|"-"|"*"|"/" {operator++;}
[!@#$%^&*()";] {special_character++;}
~ return 0;
%%

int main() {
	yylex();
	printf("\nKEYWORDS: %d\nIDENTIFIERS: %d\nNUMBERS: %d\nUNSIGNED NUMBERS: %d\n",keyword,identifier,number,unsigned_number);
	printf("DELIMITERS: %d\nASSIGNMENT OPERATORS: %d\nOPERATORS: %d\nSPECIAL CHARACTERS: %d\n",delimiter,assignment_operator,operator,special_character);
	return 0;
}
