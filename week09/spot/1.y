%{
	#include "y.tab.h"
%}

%option noyywrap

%%
[a-zA-Z_][a-zA-Z0-9_]* {
	return IDENTIFIER;
}
[0-9]+ {
	yylval = atoi(yytext);
	return INTEGER;
}
[ \t] ;
.|\n {
	return *yytext;
}
%%