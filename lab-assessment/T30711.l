%option noyywrap

%{
	/* 2019103071 */
	#include <stdio.h>
	int keyword = 0, identifier = 0, number = 0;
	int unsigned_number = 0, delimiter = 0, assignment_operator = 0;
	int operator = 0, special_character = 0, parantheses = 0;
%}

%%
if|then|else|for|while|int|float {keyword++;}
[a-z]+([a-z]|[0-9])* {identifier++;}
[0-9]* {number++;}
[0-9]+(.[0-9]+)?(E[+|-]?[0-9])? {unsigned_number++;}
[\n \t] {delimiter++;}
= {assignment_operator++;}
"+"|"-"|"*"|"/" {operator++;}
[!@#$%^&*"] {special_character++;}
[()] {parantheses++;}
~ return 0;
%%

int main() {
	extern FILE *yyin, *yyout;
	yyin = fopen("T30711_input.txt", "r");
	yyout = fopen("T30711_output.txt", "w");
	yylex();
	fprintf(yyout,"\nKEYWORDS: %d\nIDENTIFIERS: %d\nNUMBERS: %d\nUNSIGNED NUMBERS: %d\nDELIMITERS: %d\nASSIGNMENT OPERATORS: %d\nOPERATORS: %d\nSPECIAL CHARACTERS: %d\nPARANTHESIS: %d\n",keyword,identifier,number,unsigned_number,delimiter,assignment_operator,operator,special_character,parantheses);

	return 0;
}
