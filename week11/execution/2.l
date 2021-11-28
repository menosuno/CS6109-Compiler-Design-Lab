%option noyywrap
%{
	#include "y.tab.h"
	#include<stdio.h>
	#include<string.h>
%}

%%
("i") {printf("if\n"); return IF;}
("e") {printf("else\n"); return ELSE;}
("b") {printf("boolean expression\n"); return BOOL_EXPR;}
("t") {printf("then\n"); return THEN;}
("a") {printf("statement\n"); return STATEMENT;}
(";") {printf("Semicolon\n"); return SEMI;}
. {;}
[\t\n]+ {;}
%%
