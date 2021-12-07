%option noyywrap
%{
	int match = 0;
%}

%%
[a-zA-z0-9._]+@[a-z]+".com"|".in" {match = 1;}
\n return 0;
%%

int main() {
	yylex();
	if(match)
		printf("\nValid email id!\n");
	else
		printf("\nInvalid email id!\n");
}