
%{
#include <stdio.h>
#include <string.h>
#include <ctype.h>

int char_count = 0;
int word_count = 0;
int line_count = 0;
int comment_count = 0;

char *keywords[] = {
    "int","float","double","char","if","else","for","while","do",
    "switch","case","break","continue","return","void","const","struct"
};
int keyword_count = sizeof(keywords)/sizeof(keywords[0]);
%}

%%

"//".*                     { comment_count++; line_count++; }  // single-line comment

"/*"([^*]|[\r\n]|(\*+([^*/]|[\r\n])))*"*+/" { comment_count++; } // multi-line comment

[ \t]+                     { /* ignore spaces */ }

\n                         { line_count++; char_count++; }

[a-z]                      { char_count++; putchar(toupper(yytext[0])); }

[A-Z0-9]                   { char_count++; putchar(yytext[0]); }

[_a-zA-Z][_a-zA-Z0-9]*     { 
                              word_count++;
                              char_count += yyleng;

                              // Check keyword
                              int isKeyword = 0;
                              for(int i=0;i<keyword_count;i++){
                                  if(strcmp(yytext,keywords[i])==0){
                                      isKeyword = 1;
                                      break;
                                  }
                              }
                              if(isKeyword)
                                  printf("\nKeyword: %s\n", yytext);
                              else
                                  printf("\nIdentifier: %s\n", yytext);
                            }

[0-9]+                      { printf("\nNumber: %s\n", yytext); char_count += yyleng; word_count++; }

"=="|"!="|"<="|">="|"="|"+"|"-"|"*"|"/"|"%"|"<"|">" { printf("\nOperator: %s\n", yytext); char_count += yyleng; }

[;,\(\)\{\}]                { printf("\nSymbol: %s\n", yytext); char_count += yyleng; }

.                           { char_count++; putchar(yytext[0]); }

%%

int main(int argc, char *argv[]){
    if(argc < 2){
        printf("Usage: %s <source-file>\n", argv[0]);
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    if(!file){
        printf("Cannot open file %s\n", argv[1]);
        return 1;
    }
    yyin = file;
    yylex();

    printf("\n\nTotal Characters: %d\n", char_count);
    printf("Total Words: %d\n", word_count);
    printf("Total Lines: %d\n", line_count);
    printf("Total Comment Lines: %d\n", comment_count);

    fclose(file);
    return 0;
}

// Fix for undefined reference to yywrap
int yywrap() {
    return 1;
}
