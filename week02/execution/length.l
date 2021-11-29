%option noyywrap
%{
  #include<stdio.h>  
  int length;
%} 

%% 
[a-zA-Z0-9]+ {length=yyleng;}
%% 

int main() 
{ 
  yylex();
  printf("length of given string is : %d", length);
  return 0;
}