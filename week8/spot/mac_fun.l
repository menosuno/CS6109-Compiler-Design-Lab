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
	bool is_end_of_arg = false;
	char func_name[N], arg[M][N], body[N];
%}

%%

	"#define" ;
	[a-zA-Z_][a-zA-Z0-9_]* {
		if (flag == 0) {
			strcpy(func_name, yytext);
			flag++;
		}
		else if (flag == 1) {
			strcpy(arg[++cur_arg_no], yytext);
		}
		else if (flag == 2) {
			strcat(body, yytext);
		}
	}
	. {
		if (yytext[0] == ')' && !is_end_of_arg) {
			flag++;
			is_end_of_arg = true;
		}
		else if (flag == 2) 
			strcat(body, yytext);
	}

%%

int main() {
	yyin = fopen("input2.txt", "r");
	yylex();
	FILE *fp = fopen("output2.txt", "w");
	fprintf(fp, "int %s1(", func_name);
	for (int i = 0; i < cur_arg_no; i++) 
		fprintf(fp, "int %s, ", arg[i]);
	fprintf(fp, "int %s) {\n\treturn %s;\n}", arg[cur_arg_no], body);
	fprintf(fp, "\n\nchar %s2(", func_name);
	for (int i = 0; i < cur_arg_no; i++) 
		fprintf(fp, "char %s, ", arg[i]);
	fprintf(fp, "char %s) {\n\treturn %s;\n}", arg[cur_arg_no], body);
	fprintf(fp, "\n\nfloat %s3(", func_name);
	for (int i = 0; i < cur_arg_no; i++) 
		fprintf(fp, "float %s, ", arg[i]);
	fprintf(fp, "float %s) {\n\treturn %s;\n}", arg[cur_arg_no], body);
	return 0;
}