%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
[0-9]+              { 
    int n = atoi(yytext);
    if(n > 0)
        printf("%d is Positive\n", n);
    else if(n == 0)
        printf("Number is Zero\n");
}
-[0-9]+             { 
    int n = atoi(yytext);
    printf("%d is Negative\n", n);
}
\n                  {  }
.                   { printf("Invalid input: %s\n", yytext); }
%%

int main() {
    printf("Enter a number: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
