%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
[0-9]+[\+][0-9]+    { 
    int a, b;
    sscanf(yytext, "%d+%d", &a, &b);
    printf("%d + %d = %d\n", a, b, a+b);
}
[0-9]+[\-][0-9]+    { 
    int a, b;
    sscanf(yytext, "%d-%d", &a, &b);
    printf("%d - %d = %d\n", a, b, a-b);
}
[0-9]+[\*][0-9]+    { 
    int a, b;
    sscanf(yytext, "%d*%d", &a, &b);
    printf("%d * %d = %d\n", a, b, a*b);
}
[0-9]+[\/][0-9]+    { 
    int a, b;
    sscanf(yytext, "%d/%d", &a, &b);
    if(b != 0)
        printf("%d / %d = %d\n", a, b, a/b);
    else
        printf("Error: Division by zero!\n");
}
\n    {  }
.     { printf("Invalid expression: %s\n", yytext); }
%%

int main() {
    printf("Enter expression (like 5+3, 8-2, 6*7, 10/2):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
