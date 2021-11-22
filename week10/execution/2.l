%option noyywrap
%{
	#include<stdio.h>
	#include"y.tab.h"
%}

%%
[0-9] {yylval = atoi(yytext); return NUMBER;}
"==" {return EQ;}
">=" {return GE;}
"<=" {return LE;}
"!=" {return NE;}
[\t] ;
[\n] return 0;
. {return yytext[0];}
%%