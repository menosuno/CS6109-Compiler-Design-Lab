%option noyywrap
%{
	#include "y.tab.h"
	#include<stdio.h>
	#include<string.h>
%}

%%
("if") { printf("if\n"); return IF; }
[a-zA-Z][a-zA-Z0-9]* { printf("identifier\n"); return ID; }
[0-9]+ { printf("num\n"); return NUM; }
(\|\|) { printf("or\n"); return OR; }
("&&") { printf("and\n"); return AND; }
("!") { printf("not\n"); return NOT; }
(\=\=) { printf("double equals\n"); return DOUBLE_EQUALS; }
(;) { printf("Semicolon\n"); return SEMI; }
\( { printf("open bracket\n"); return OPEN; }
\) { printf("closing bracket\n"); return CLOSE; }
. {;}
[\t\n]+ {;}
%%
