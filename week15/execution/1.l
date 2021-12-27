%option noyywrap
%{
        #include <stdio.h>
        #include "y.tab.h"
        extern int yylval;
%}


%%
"while" {return WHILE;}
"do"    {return DO;}
"if"    {return IF;}
"then"  {return THEN;}
"else"  {return ELSE;}
"="    {return ASSIGN;}
"=="    {return EQ;}
"!="    {return NE;}
"+"     {return PLUS;}
"-"     {return MINUS;}
"&&"    {return AND;}
"||"    {return OR;}
[0-9]+  {sscanf(yytext, "%d", &yylval); return NUM;}
[a-z]   {return ID;}
[ \t\n] {;}
.       {return yytext[0];}
%%
