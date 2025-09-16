%{
#include <stdio.h>
%}

%%
[a-z]   { printf("%c", yytext[0]-32); }   
[A-Z]   { printf("%c", yytext[0]); }      
.       { printf("%c", yytext[0]); }     
\n      { printf("\n"); }
%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}
