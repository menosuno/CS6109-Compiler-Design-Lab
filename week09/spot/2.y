%{
	#include "y.tab.h"
%}

%option noyywrap

%%
"int"|"char"|"float"|"double" {
	return DATA_TYPE;
}
"for" {
	return FOR_IDENT;
}
[a-zA-Z_][a-zA-Z0-9_]* {
	return IDENTIFIER;
}
[0-9]+ {
	yylval = atoi(yytext);
	return INTEGER;
}
"+="|"-="|"*="|"/=" {
	return CMPD_ASSIGNMENT_OP;
}
"<"|"<="|">"|">="|"=="|"!=" {
	return REL_OP;
}
[ \t] ;
.|\n {
	return *yytext;
}
%%