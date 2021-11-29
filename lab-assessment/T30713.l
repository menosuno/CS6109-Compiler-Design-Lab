%option noyywrap
%{
	/* 2019103071 */
	#include <stdio.h>
	#include <string.h>
	#define SIZE 100

	int count = 0;
	int closed = 0;
	char init[2][SIZE], cond[2][SIZE], inc[2][SIZE];
%}

%x FOR FORINIT FORCOND FORINC BODY

ws [ \t]
wsn [ \t\n]

%%

for{ws}*\( {
	BEGIN(FORINIT);
}

<FORINIT>int ;

<FORINIT>; {
	if (yyleng > 1) {
		yyless(yyleng - 1);
		strcpy(init[count], yytext);
	}
	else {
		BEGIN(FORCOND);
	}
}

<FORCOND>; {
	if (yyleng > 1) {
		yyless(yyleng - 1);
		strcpy(cond[count], yytext);
	}
	else {
		BEGIN(FORINC);
	}
}

<FORINC>\) {
	if (yyleng > 1) {
		yyless(yyleng - 1);
		strcpy(inc[count], yytext);
	}
	else {
		BEGIN(FOR);
	}
}

<FOR>{wsn}*\{ {
	count++;
	if (count >= 2) {
		fprintf(yyout, "for(int %s, %s;", init[0], init[1]);
		fprintf(yyout, " %s && %s;", cond[0], cond[1]);
		fprintf(yyout, " %s, %s) {", inc[0], inc[1]);
		BEGIN(BODY);
	}
	else {
		BEGIN(INITIAL);
	}
}

<FORINIT,FORCOND,FORINC>. yymore();

<BODY>\} {
	if (closed == 0) {
		closed = 1;
		ECHO;
	}
} 

<BODY>. ECHO;

<*>. ;

%%
int main()
{
	extern FILE *yyin, *yyout;
	yyin = fopen("T30713_input.txt", "r");
	yyout = fopen("T30713_output.txt", "w");
	yylex();

	return 0;
}
