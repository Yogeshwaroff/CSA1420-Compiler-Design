%{
#include <stdio.h>
int header_count = 0;
%}

%%
"#include"[ \t]*"<"[a-zA-Z0-9\.]+">"     { header_count++; }
"#include"[ \t]*\"[a-zA-Z0-9\.]+\"       { header_count++; }
.|\n                                     ;   /* ignore everything else */
%%

int main() {
    printf("Enter a C program (Ctrl+D to stop):\n");
    yylex();
    printf("\nNumber of header files: %d\n", header_count);
    return 0;
}

int yywrap() {
    return 1;
}
