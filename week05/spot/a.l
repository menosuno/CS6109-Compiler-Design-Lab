%option noyywrap
%{
    #undef yywrap
    #define yywrap() 1

    int n = 0;
%}

%%
"while"|"if"|"else" {
    n++;
    fprintf(yyout,"\nKeywords: %s", yytext);
}
"int"|"float"       {
    n++;
    fprintf(yyout,"\nKeywords: %s", yytext);
}                    
"<="|"=="|"="|"++"|"-"|"*"|"+" {
    n++;
    fprintf(yyout,"\nOperator: %s", yytext);
}
[()}{|, ;] {
    n++;
    fprintf(yyout,"\nSeperator: %s", yytext);
}
[0-9]*"."[0-9]+ {
    n++;
    fprintf(yyout,"\nFloat: %s", yytext);
                }
[0-9]+ {
            n++;
            fprintf(yyout,"\nInteger: %s", yytext);
        }                               
%%

int main()
{
    char fname[100];
    yyin = fopen("input_a.txt", "r");
    yyout = fopen("output_a.txt","w");
    yylex();
    return 0;
}
