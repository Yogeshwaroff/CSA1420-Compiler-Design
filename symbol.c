#include <stdio.h>
#include <string.h>

struct Symbol {
    char name[20];
    char datatype[10];
    int address;
    int value;
} table[50];

int main() {
    int count = 0;

    strcpy(table[count].name, "a");
    strcpy(table[count].datatype, "int");
    table[count].address = 1000 + count * 4;
    table[count].value = 8;
    count++;

    strcpy(table[count].name, "b");
    strcpy(table[count].datatype, "float");
    table[count].address = 1000 + count * 4;
    table[count].value = 9;
    count++;

    strcpy(table[count].name, "c");
    strcpy(table[count].datatype, "char");
    table[count].address = 1000 + count * 4;
    table[count].value = 65;
    count++;

    int j;
    printf("\n---------------------------------------------\n");
    printf("| %-10s | %-10s | %-10s | %-10s |\n", "Name", "Datatype", "Address", "Value");
    printf("---------------------------------------------\n");
    for(j=0;j<count;j++) {
        printf("| %-10s | %-10s | %-10d | %-10d |\n",
               table[j].name, table[j].datatype, table[j].address, table[j].value);
    }
    printf("---------------------------------------------\n");

    return 0;
}

