%{
#include <stdio.h>
%}

%%
([0-2][0-9]|3[0-1])\/(0[1-9]|1[0-2])\/[0-9]{4}    { 
    printf("Valid DOB format: %s\n", yytext); 
}
\n    { /* ignore newline */ }
.     { printf("Invalid DOB format\n"); }
%%

int main() {
    printf("Enter DOB (DD/MM/YYYY): ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
