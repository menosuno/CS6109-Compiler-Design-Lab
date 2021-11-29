%option noyywrap
%{
	/* 2019103071 */
	#include <stdio.h>
	#include <string.h>
	char matched[1024];
	int isv(char c) {
		if(c <= 'Z') {c += 32;}
		if(c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u') 
		{return 1;}
		else {return 0;}
	}
%}

%%
([a-zA-Z]+) {
	if(isv(yytext[0])) {
		int ptr = 0;
		while(yytext[ptr] != '\0') {
			matched[ptr] = yytext[ptr]; 
			ptr ++;
		}
		matched[ptr] = 'a';
		matched[ptr + 1] = 'y';
		matched[ptr + 2] = '\0';
	}
	else {
		int ptr1 = 1;
		int ptr2 = 0;
		while(yytext[ptr1] != '\0') {
			matched[ptr2] = yytext[ptr1]; 
			ptr1++; 
			ptr2 ++;
		}
		matched[ptr2] = yytext[0];
		matched[ptr2 + 1] = 'a';
		matched[ptr2 + 2] = 'y';
		matched[ptr2 + 3] = '\0';
	}
	printf("%s", matched);
}
. {printf("%s", yytext);}
[\t\n]+ {printf("%s", yytext);}
%%

int main() {
	yyin = fopen("T30712.txt", "r");
	yylex();
	return 0;
}
