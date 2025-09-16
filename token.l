%{
#include <stdio.h>
%}

%%

int|float|char|if|else|while|for|return     { printf("Keyword: %s\n", yytext); }

[a-zA-Z_][a-zA-Z0-9_]*                      { printf("Identifier: %s\n", yytext); }

[0-9]+                                      { printf("Integer: %s\n", yytext); }

[0-9]+\.[0-9]+                              { printf("Float: %s\n", yytext); }

=|\+|\-|\*|\/                               { printf("Operator: %s\n", yytext); }

;|\(|\)|\{|\}                               { printf("Symbol: %s\n", yytext); }

[ \t\n]+                                    { /* ignore whitespace */ }

.                                           { printf("Unknown: %s\n", yytext); }

%%

int yywrap() { return 1; }

int main() {
    yylex();
    return 0;
}
