%option noyywrap
%{ 
    #include <stdio.h>
    int longest_word = 0;
%}

%%
[a-zA-Z]+ {
    if(yyleng > longest_word) {  
        longest_word = yyleng;
    }
}
%%

int main() {
    yyin = fopen("file2.txt","r");
    yylex(); 
    printf("largest: %d",longest_word);
    printf("\n");
    return 0;
}
