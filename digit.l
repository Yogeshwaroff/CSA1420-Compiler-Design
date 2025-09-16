%{
#include <stdio.h>
%}

%%
[0-9]       { printf("%s is a Digit\n", yytext); }
[A-Za-z]+   { printf("%s is an Alphabet\n", yytext); }
.           { printf("%s is Not a Digit\n", yytext); }
\n          { /* ignore newline */ }
%%

int main() {
    printf("Enter input: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
