%option noyywrap
%{
	#include <stdio.h>
	int flag = 0;
%}

%%
^(d|D).*(t|T)$ {
	flag = 1;
	printf("String %s starts with d ends with t..\n",yytext);
}
def {
	flag = 1;
	printf("String %s Matches with string def..\n",yytext);
}
.*(ab)+.* {
	flag = 1;
	printf("String %s Contains one/more ab s concatenated..\n",yytext);
}
[^A-Z]+ {
	flag = 1;
	printf("String %s Contains no Uppercase characters..\n",yytext);
}
\n return 0;
%%

int main() {
	yylex();
	if(flag == 0)
		printf("None of the conditions satisfy...\n");
	return 0;
}
