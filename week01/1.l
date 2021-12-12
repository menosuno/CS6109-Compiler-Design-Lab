%option noyywrap

/** definitions **/
%{
	#include <stdio.h>
	int line_no = 0;
	int char_no = 0;
%}

/** actions **/
%%
\n ++line_no;
. ++char_no;
/** on scanning the word 'end', yylex() stops scanning **/
end return 0;
%%

/** user sub-routines **/
int main() {
	yylex();
	printf("number of lines = %d, number of chars = %d\n",line_no,char_no );
	return 0;
}
