#include<stdio.h>

int main(){
    int i=0;
    char* pcVideoMemory = (char *) 0xB8000;

    while(1){
        *(pcVideoMemory) = 0x00;
        *(pcVideoMemory+1)=0x0A;
        pcVideoMemory+=2;

        i+=1;

        if(i >= 80*25){
            break;
        }
    }

    return 0;
}