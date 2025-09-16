#include <stdio.h>
#include <string.h>

int main(){
    char firstS[10],firstA[10],firstB[10];
    int i,len;
    strcpy(firstA,"e");
    strcpy(firstB,"e");
    len=0;
    firstS[len++]='a';
    firstS[len++]='b';
    firstS[len]='\0';
    printf("FIRST(A) = { %s }\n",firstA);
    printf("FIRST(B) = { %s }\n",firstB);
    printf("FIRST(S) = { ");
    for(i=0;i<len;i++){
        if(i) printf(", ");
        printf("%c",firstS[i]);
    }
    printf(" }\n");
    return 0;
}

