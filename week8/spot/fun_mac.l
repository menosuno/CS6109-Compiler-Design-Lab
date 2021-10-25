%option noyywrap

%{
	#include <stdio.h>
	#include <string.h>
	#include <stdbool.h>
	#include <ctype.h>
	#define N 256
	#define M 10

	int flag = 0;
	int cur_arg_no = -1;
	bool is_type = true;
	char return_type[10], func_name[N], arg[M][N], body[N];
	char* trim(char *str);
%}

%%

	"return" ;

	[a-zA-Z_][a-zA-Z0-9_]* {
		if (flag == 0) {
			strcpy(return_type, yytext);
			flag++;
		}
		else if (flag == 1) {
			strcpy(func_name, yytext);
			flag++;
		}
		else if (flag == 2) {
			if (!is_type) strcpy(arg[++cur_arg_no], yytext);
			is_type = !is_type;
		}
		else if (flag == 3) {
			char buf[N];
			sprintf(buf, "(%s)", yytext);
			strcat(body, buf);
		}
	}

	"{"|"}" { flag++; }

	. {
		if (yytext[0] == ';') 
			flag++;
		if (flag == 3) 
			strcat(body, yytext);
	}

%%

int main() {
	yyin = fopen("input1.txt", "r");
	yylex();
	FILE *fp = fopen("output1.txt", "w");
	fprintf(fp, "#define %s(", func_name);
	for (int i = 0; i < cur_arg_no; i++) 
		fprintf(fp, "%s, ", arg[i]);
	fprintf(fp, "%s) (%s)", arg[cur_arg_no], trim(body));
	return 0;
}

char* trim(char *str) {
	int n = strlen(str);
	char *p = str;
	while (isspace(*p)) p++;
	while (isspace(str[n - 1])) n--;
	str[n] = '\0';
	return p;
}