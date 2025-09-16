%{
#include <stdio.h>
#include <string.h>

char words[100][50];   
char numbers[100][50]; 
int wcount = 0, ncount = 0;
%}

%%
[0-9]+ {
    strcpy(numbers[ncount++], yytext);  
}
[A-Za-z]+ {
    strcpy(words[wcount++], yytext);    
}
[ \t\n]+   ;   
.          ;   
%%

int main() {
    printf("Enter text (Ctrl+D to stop):\n");
    yylex();

    printf("\nNumbers:\n");
    for(int i=0; i<ncount; i++) {
        printf("%s\n", numbers[i]);
    }

    printf("\nWords:\n");
    for(int i=0; i<wcount; i++) {
        printf("%s\n", words[i]);
    }

    return 0;
}

int yywrap() {
    return 1;
}
