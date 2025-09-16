#include <stdio.h>
#include <string.h>

int main(){
    char followS[10],followA[10],followB[10];
    strcpy(followS,"$");
    strcpy(followA,"a,b");
    strcpy(followB,"a,b");
    printf("FOLLOW(S) = { %s }\n",followS);
    printf("FOLLOW(A) = { %s }\n",followA);
    printf("FOLLOW(B) = { %s }\n",followB);
    return 0;
}

