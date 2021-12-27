%option noyywrap
%{
	#include <stdio.h>
	int i = 0, j = 0, k = 0, f = 0, l = 0;
	char c[100], left[100];
	char *a = "for";
	char s[100], z[100], x[100], y[100];
	extern FILE *yyin, *yyout;
%}

id [a-z]+
eq =
op (<=)|(>=)|(!=)|(==)
in (\+\+)|(\-\-)
num [a-zA-Z0-9]+
sem [;]
sp ""
key "int"|"char"|"float"

%%
while	{fprintf(yyout,"%s",a);}
[ \t\n]+	{;}
{key}(" ")?{id}(" ")?{eq}(" ")?{num}(;)	{while(i<yyleng){x[i]=yytext[i];i++;}}
{id}(" ")?{op}(" ")?{num}(" ")?{sem}	{while(j<yyleng-1){y[j]=yytext[j];j++;}}
{id}{eq}{id}"+"{num}{sem}|{in}{id}{sem}|{id}{in}{sem}	{fprintf(yyout,"%s;%s%s%s\n\t%s\n",y,yytext,s,c,left);}

("(")	{ECHO;fprintf(yyout,"%s",x);}
(")")	{while(k<(yyleng)){s[k]=yytext[k];k++;}}
("{")	{while(f<(yyleng)){c[f]=yytext[f];f++;}}
{id}(" ")?{id}?{sem}	{while(l<(yyleng)){left[l]=yytext[l];l++;}}
("}")	{fprintf(yyout,"%s\n",yytext);}
.	{ECHO;}
%%

int main()
{
	yyin = fopen("input2.txt","r");
	yyout = fopen("output2.txt","w");
	yylex();
	return 0;
}
