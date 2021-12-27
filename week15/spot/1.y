%{
        #include <stdio.h>
        #include <stdlib.h>
        void yyerror(const char *s);
        extern FILE *yyin;
        extern int yylval;
        char str[50];
%}


%token WHILE DO IF THEN ELSE ASSIGN EQ NE PLUS MINUS AND OR NUM ID
%left AND OR

%%


start   :WHILE '(' cond ')' DO IF '(' cond ')' THEN st ELSE st {
                if ($3) {
                        printf("While condition true\n\n");
                        if ($8) {
                                printf("If cond true\n");
                        }

                        else {
                                printf("Else block\n");
                        }

                }

                else {
                        printf("While condition false\n\n");
                }

                printf("Valid.\n");
                return 0;
        }
        |error {
                yyerror("Invalid.\n");
                return 1;
        }
        ;




cond  :cond AND rexpr {$$ = $1 && $3;}
        |cond OR rexpr {$$ = $1 || $3;}
        |rexpr {$$ = $1;}
        ;


rexpr   :NUM '<' NUM {$$ = $1 < $3; printf("%d < %d = %d\n", $1, $3, $$);}
        |NUM '>' NUM {$$ = $1 > $3; printf("%d > %d = %d\n", $1, $3, $$);}
        |NUM EQ NUM {$$ = $1 == $3; printf("%d == %d = %d\n", $1, $3, $$); }
        |NUM NE NUM {$$ = $1 != $3; printf("%d != %d = %d\n", $1, $3, $$);}
        |NUM {$$ = $1;}
        ;


val     :ID
        |NUM
        ;


st    :ID ASSIGN val op val ';'
        ;


op      :PLUS
        |MINUS
        ;
%%


void yyerror(const char *s) {
        fprintf(stderr, "%s\n", s);
}


int main(int argc, char *argv[]) {
        yyin = fopen(argv[1], "r");
        return yyparse();
}
