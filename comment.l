%{
#include <stdio.h>
int comment_lines = 0;
%}

%%
"//".*                 { comment_lines++; }               
"/*"([^*]|\*+[^*/])*\*+"/"  {                               
                            char *p = yytext;
                            while (*p) {
                                if (*p == '\n') comment_lines++;
                                p++;
                            }
                        }
\n                     {  }
.                      {
                        }
%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    printf("Number of comment lines = %d\n", comment_lines);
    return 0;
}
