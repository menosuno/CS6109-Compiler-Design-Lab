%option noyywrap

%{
	#include<stdio.h>
	#include<string.h>
	#define N 100

	int op = 0;
	int count = -1;
	char cond[5][N], body[5][N];
%}

ws [ \t]
wsn [ \t\n]

%x IFCOND IFBODY
%x REM

%%

if{ws}* {
	BEGIN(IFCOND);
}

<IFCOND>\n {
	if (yyleng > 1) {
		count++;
		yyless(yyleng - 1);
		strcpy(cond[count], yytext);
	}
	else {
		switch(op) {
		case 1:
			fprintf(yyout, "if (%s && %s)\n", cond[0], cond[1]);
			BEGIN(REM);
			break;
		case 2:
			fprintf(yyout, "if (%s || %s)\n", cond[0], cond[1]);
			BEGIN(REM);
			break;
		case 0:
			BEGIN(IFBODY);
			break;
		}
	}
}

<IFBODY>if{wsn}* {
	op = 1;
	BEGIN(IFCOND);
}

<IFBODY>else{wsn}*if{wsn}* {
	op = 2;
	BEGIN(IFCOND);
}

<IFBODY>. {
	strcat(body[count], yytext);
}

<IFCOND>. yymore();

<REM>. ECHO;

<*>. ;

%%

int main(int argc, char* argv[])
{
	for(int i = 0; i < 5; ++i) {
		body[i][0] = '\0';
	}

	if (argc == 3) {
		extern FILE *yyin, *yyout;
		yyin = fopen(argv[1], "r");
		yyout = fopen(argv[2], "w");
		yylex();
	}
	else {
		printf("Format: %s Input-File Output-File", argv[0]);
	}

	return 0;
}
