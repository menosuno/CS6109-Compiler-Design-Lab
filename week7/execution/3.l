%option noyywrap
%{
	#include<stdio.h>
	#include<string.h>
	#define N 100

	int op = 0;
	int elseco=0;
	int co = -1;
	char expr[5][N], body[5][N];
%}

ws [ \t]
wsn [ \t\n]

%x IFEXP IFBODY
%x REML REMLI 

%%

if{ws}* {
	BEGIN(IFEXP);
	}

<IFEXP>\n {
	if (yyleng > 1) {
		co++;
		yyless(yyleng - 1);
		strcpy(expr[co], yytext);
	}
	else {
		switch(op) {
		case 1:
			fprintf(yyout, "if (%s && %s)\n", expr[0], expr[1]);
			BEGIN(REML);
			break;
		case 2:
			fprintf(yyout, "if (%s || %s)\n", expr[0], expr[1]);
			BEGIN(REML);
			break;
		case 0:
			BEGIN(IFBODY);
			break;
		}
	}
}

<IFBODY>if{wsn}* {
	op = 1;
	BEGIN(IFEXP);
}

<IFBODY>else{wsn}if{wsn} {
	op = 2;
	BEGIN(IFEXP);
}

<IFBODY>. {
	strcat(body[co], yytext);
}

<IFEXP>. yymore();

<REML>. ECHO;

<REML>else {
		elseco++;
		if(elseco<2)
		ECHO;
		else
		BEGIN(REMLI);
	   }

<REMLI>. ;

<*>. ;

%%
int main(int argc, char* argv[])
{
	int i;
	for( i = 0; i < 5; ++i) {
		body[i][0] = '\0';
	}

	if (argc == 3) {
		extern FILE *yyin, *yyout;
		yyin = fopen(argv[1], "r");
		yyout = fopen(argv[2], "w");
		yylex();
	}
	return 0;
}
