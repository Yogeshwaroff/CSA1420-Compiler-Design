%{
#include <stdio.h>
%}

%%

https?:\/\/[a-zA-Z0-9.-]+\.(com|org|net|in|edu)   { printf("Valid URL: %s\n", yytext); }

.|\n                                              {  }

%%

int yywrap() { return 1; }

int main() {
    yylex();
    return 0;
}
 