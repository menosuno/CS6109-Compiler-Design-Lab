%option noyywrap

%{
    #undef yywrap
    #define yywrap() 1
%}

%%
if|else|while|int|switch|for|char|print|return|def { fprintf(yyout,"%s: keywords\n", yytext);}
[a-zA-Z]([\w\d])* { fprintf(yyout, "%s: identifier\n", yytext);}
[0-9]+ { fprintf(yyout, "%s: numbers\n", yytext);}
":" {fprintf(yyout, "%s: delimiter\n", yytext);}
"+"|"-"|"*"|"/" { fprintf(yyout, "%s: arithmentic operator\n", yytext);}
"++" { fprintf(yyout, "%s: increment\n", yytext);}
"--" { fprintf(yyout, "%s: decrement\n", yytext);}
"!=" {fprintf(yyout, "%s: not equal to operator\n");}
= { fprintf(yyout, "%s: assignment operator\n", yytext);}
"<" { fprintf(yyout, "%s: greater than operator\n", yytext);}
">" { fprintf(yyout, "%s: less than operator\n", yytext);}
%%

int main(){
    yyin = fopen("input_e.txt","r");
    yyout=fopen("output_e.txt","w");
    yylex();
    return 0;
}
