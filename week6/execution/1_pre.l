%option noyywrap

%{
	#include<string.h>
	char stack[100],s[100],st[100];
	int tos=0,x=0;
	void push(char);
	void pop();
	char top();
	int priority(char c);
	extern FILE *yyin,*yyout;
%}

%%

[a-zA-Z]? {s[x] = yytext[0];x++;}

[+\-\*\/\(\)] { char op=yytext[0];
	if(tos==0||op=='(')
	push(op);
	else if(op==')'){
		while(top()!='('){
			s[x] = top();x++;
			pop();
		}
		pop();
	}
	else if(priority(op)>=priority(top())){
		push(op);
	}
	else if(priority(op)<=priority(top())){
		while(priority(op)<=priority(top())){
			s[x] = top();x++;
			pop();
		}
		push(op);
	}
}

[\n] {
	int i;
	for(i=tos-1;i>=0;i--)
		if(stack[i]!='('&&stack[i]!=')'){
			s[x] = stack[i];x++;
		}
	tos=0;
	fprintf(yyout,"%s\n",strrev(s));
	x=0;
}

%%

int main() {
	yyin=fopen("input1.txt","r");
	yyout=fopen("input1_pre.txt","w");
	while((fscanf(yyin,"%s",st))!=EOF)
	{
		strrev(st);
		fprintf(yyout,"%s\n",st);
	}
	fclose(yyin);
	fclose(yyout);
	yyin=fopen("input1_pre.txt","r");
	yyout=fopen("output1b.txt","w");
	yylex();
}

void pop(){
	tos--;
}
char top(){
	return stack[tos-1];
}
void push(char c){
	stack[tos]=c;
	tos++;
}
int priority(char c){
	switch(c){
		case '(':return 0;
		case ')':return 0;
		case '+':return 1;
		case '-':return 1;
		case '*':return 2;
		case '/':return 2;
	}
}
