%option noyywrap

%{
    #undef yywrap
    #define yywrap() 1
    int n = 0;
    int ln = 0;
%}

%%
if|else|while|int|switch|for|char { fprintf(yyout,"%s: keywords\n", yytext);}
[a-zA-Z]([a-zA-Z0-9])* { fprintf(yyout, "%s: identifier\n", yytext);}
[0-9]+ { fprintf(yyout, "%s: numbers\n", yytext);}
([ ])|\n|\t { fprintf(yyout, "%s: whitespace\n", yytext);}
"+"|"-"|"*"|"/" { fprintf(yyout, "%s: arithmentic operator\n", yytext);}
"++" { fprintf(yyout, "%s: increment\n", yytext);}
! | @|#\/ { fprintf(yyout, "%s: special", yytext);}
= { fprintf(yyout, "%s: assignment operator\n", yytext);}
"<" { fprintf(yyout, "%s: greater than operator\n", yytext);}
">" { fprintf(yyout, "%s: less than operator\n", yytext);}
%%

int main(){
    yyin = fopen("input_b.txt","r");
    yyout=fopen("output_b.txt","w");
    yylex();
    return 0;
}
