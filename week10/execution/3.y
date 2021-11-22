%{
    #include<stdio.h>
    int flag=0;
    void yyerror();
    int yylex();
%}

%token NUMBER
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%%
ArithmeticExpression: E{printf("\nANSWER = %d\n",$$);
return 0;
};
E:E'+'E {$$=$1+$3;}
|E'-'E {$$=$1-$3;}
|E'*'E {$$=$1*$3;}
|E'/'E {$$=$1/$3;}
|E'%'E {$$=$1%$3;}
|'('E')' {$$=$2;}
| NUMBER {$$=$1;}
;
%%

void main() {
    printf("\nENTER THE OPERATORS AND THE OPERANDS:\n");
    yyparse();
    if(flag == 0)
        printf("\nVALID EXPRESSION\n");
}

void yyerror() {
    printf("\nINVALID EXPRESSON\n");
    flag = 1;
}