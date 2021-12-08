%option noyywrap

%{
    #undef yywrap
    #define yywrap() 1

    #include <stdio.h>
%}

%%

if|else|while|for|print|def|return|int|char|float|double|class|static|enum { 
        fprintf(yyout,"%s: keywords\n", yytext);
    }

[a-zA-Z_][\w\d]* { 
        fprintf(yyout, "%s: identifier\n", yytext);
    }

[\d]+\.*[\d]* { 
        fprintf(yyout, "%s: numbers\n", yytext);
    }

[ ]|\n|\t { 
        fprintf(yyout, "%s: whitespace\n", yytext);
    }

"+"|"-"|"*"|"/"|"%" { 
        fprintf(yyout, "%s: arithmentic operator\n", yytext);
    }

"++"|"--" { 
        fprintf(yyout, "%s: unary operators\n", yytext);
    }

"=" { 
        fprintf(yyout, "%s: assignment operator\n", yytext);
    }

"<"|"<="|">"|">=" { 
        fprintf(yyout, "%s: comparison operator\n", yytext);
    }

%%

int main() {
    yyin = fopen("input_b.txt","r");
    yyout = fopen("output_b.txt","w");
    yylex();
    return 0;
}
