%option noyywrap
%{
	#include<stdio.h>
	#include "y.tab.h" 
%}

alpha [A-Za-z]
digit [0-9]

%%
[\t \n]
printf[^;]* {return PRINTF;};
"int"|"float"|"char" return DTYPE;
for return FOR;
{digit}+ return NUM;
{alpha}({alpha}|{digit})* return ID; 
"<=" return LE; 
">=" return GE; 
"==" return EQ; 
"!=" return NE; 
"||" return OR; 
"&&" return AND;
. return yytext[0];
%%