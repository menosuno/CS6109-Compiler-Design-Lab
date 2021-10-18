%option noyywrap
%{
	#include<stdio.h>
	#include<string.h>
	char expr[100];
	char upd[100];

%}

%x FOR FORINI FOREXP FORUPD FORBODY
%%

for {
	BEGIN(FOR);
    }

<FOR>\( {
		BEGIN(FORINI);	
	 }

<FORINI>; {
		fprintf(yyout, "%s\n", yytext);
		BEGIN(FOREXP);
	  }

<FOREXP>; {
		if(yyleng>1)
		{
			yyless(yyleng-1);
			strcpy(expr,yytext);
			strcat(expr, "\0");
		}
		else
		{
			BEGIN(FORUPD);
		}
	}

<FORUPD>\) {
		if(yyleng>1)
		{
			yyless(yyleng-1);
			strcpy(upd, yytext);
			strcat(upd, "\0");
		}
	}

<FORUPD>\{  {
		fprintf(yyout, " while(%s){\n",expr );
		BEGIN(FORBODY);
	    }

<FORUPD>[ \t] ;

<FORINI,FOREXP,FORUPD>. yymore();

<FORBODY>\} {
		fprintf(yyout, "%s\n", upd);
		ECHO;
		BEGIN(INITIAL);
	    }

<FORBODY>for {
		BEGIN(FOR);
	     }

<FORBODY>. {
		ECHO;
	    }

<*>[ \t\n] ;

%%

int main(int argc, char *argv[])
{
	if(argc == 3)
	{
		extern FILE *yyin, *yyout;
		yyin = fopen(argv[1], "r");
		yyout = fopen(argv[2], "w");
		yylex();
	}
	return 0;
}
