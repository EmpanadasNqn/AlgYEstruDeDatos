#include <stdio.h>

int pedir_entero(char name){
    int x;

    printf("Ingrese un entero en la variable %c:=",name);
    scanf("%d",&x);
    
    return x;
}

void imprimir_entero(char name, int x){
    printf("El entero %c es %d.\n",name,x);
}

int main(){
    int i;

    i = pedir_entero('i');

    while (i!=0){
        imprimir_entero('i',i);
        i=0;
        imprimir_entero('i',i);
    }
    
    printf("El valor final de i es %d\n",i);

    return 0;
}

/*
Ingrese un entero en la variable i:=400
El entero i es 400.
El entero i es 0.
El valor final de i es 0

Ingrese un entero en la variable i:=0
El valor final de i es 0

Ingrese un entero en la variable i:=-10
El entero i es -10.
El entero i es 0.
El valor final de i es 0
*/