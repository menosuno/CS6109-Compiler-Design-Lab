%option noyywrap
%{
	#include<stdio.h>
	#include<string.h>
%}
%%
[a-z]+ {
yyless(4);
fprintf(yyout,"\n Lower = %s",yytext);
fprintf(yyout,"\nThe word after yyless() = %s",yytext);}
[a-zA-Z]+ {printf("\nMixed letter is = %s",yytext);}
%%
int main()
{
	yyin = fopen("input_d.txt","r");
	yyout = fopen("output_d.txt","w");
	yylex();
	return 0;
}
