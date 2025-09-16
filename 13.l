%{
#include <stdio.h>
#include <ctype.h>
int char_count = 0, word_count = 0, line_count = 1, comment_count = 0;
void to_upper(char *str);
%}

%option noyywrap

/* Regular expressions */
WORD [a-zA-Z]+
WHITESPACE [ \t]
NEWLINE \n
COMMENT "//"[^\n]*

%%

{COMMENT} { 
    comment_count++; 
    printf("Comment: %s\n", yytext);
}

{WORD} {
    char_count += yyleng;
    word_count++;
    to_upper(yytext);
    printf("Word: %s\n", yytext);
}

{WHITESPACE} {
    char_count += yyleng;
}

{NEWLINE} {
    char_count++;
    line_count++;
}

. {
    char_count++;
    printf("Symbol: %s\n", yytext);
}

%%

void to_upper(char *str) {
    for(int i = 0; str[i]; i++) {
        str[i] = toupper(str[i]);
    }
}

int main() {
    yylex();
    printf("\nSummary:\n");
    printf("Characters: %d\n", char_count);
    printf("Words: %d\n", word_count);
    printf("Lines: %d\n", line_count);
    printf("Comments: %d\n", comment_count);
    return 0;
}