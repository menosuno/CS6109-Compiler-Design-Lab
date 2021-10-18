%option noyywrap
%{
	#include<stdio.h>
	#include<string.h>
	#define N 100

	int count = 0;
	int closed = 0;
	char init[2][N], cond[2][N], inc[2][N];
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

int main(int argc, char* argv[]) {
	if (argc == 3) {
		extern FILE *yyin, *yyout;
		yyin = fopen(argv[1], "r");
		yyout = fopen(argv[2], "w");
		yylex();
	}
	else {
		printf("Format: %s Input-file Output-file", argv[0]);
	}

	return 0;
}
