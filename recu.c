#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <stdlib.h>

char input[100];
int i, error;

void E();
void Eprime();
void T();
void Tprime();
void F();

void E() {
    T();
    Eprime();
}

void Eprime() {
    if(input[i] == '+') {
        i++;
        T();
        Eprime();
    }
}

void T() {
    F();
    Tprime();
}

void Tprime() {
    if(input[i] == '*') {
        i++;
        F();
        Tprime();
    }
}

void F() {
    if(input[i] == '(') {
        i++;
        E();
        if(input[i] == ')') {
            i++;
        } else {
            error = 1;
        }
    } else if(isalpha(input[i])) {
        i++;
    } else {
        error = 1;
    }
}

int main() {
    printf("Enter the input: ");
    scanf("%s", input);
    i = 0;
    error = 0;
    E();
    if(strlen(input) == i && error == 0) {
        printf("String accepted\n");
    } else {
        printf("String rejected\n");
    }
    return 0;
}

