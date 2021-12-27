%option noyywrap
%{
    #include <stdio.h>
    #include <string.h>
    #define N 30
    char cond[N], def[N], body[N];
    int i, j;
%}

op       "++"|"--"
rop      "<"|">"|"<="|">="|"=="|"!="
id       [a-zA-Z][a-zA-Z0-9]*
num      [0-9]*
sp       [ ]
ifopen   ")\n("
elseopen "else\n("

%%
<<EOF>>                         return 0;
{id}{sp}{rop}{sp}{num}{sp}*     {strcpy(cond, yytext);}
{ifopen}[^}]*                   {for(i=3, j=0; i<N; i++, j++) {body[i] = yytext[i];}}
{elseopen}[^}]*                 {for(i=6, j=0; i<N; i++, j++) {def[j] = yytext[i];}}
.                               ;
[\n]                            ;
%%

int main() {
    extern FILE *yyin, *yyout;
    yyin = fopen("input3.txt", "r");
    yyout = fopen("output3.txt", "w");
    yylex();
    fprintf(yyout, "switch(true)\n{\ncase %s:\t\t%s\tbreak;\ndefault:\t%s\n}", cond, body, def);
    return 0;
}
