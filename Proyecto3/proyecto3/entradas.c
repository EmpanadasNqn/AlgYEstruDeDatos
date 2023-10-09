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
    int x = pedir_entero('x');
    imprimir_entero('x',x);

    return 0;
}

/*
Ingrese un entero en la variable x:=7
El entero x es 7.

Ingrese un entero en la variable x:=-90
El entero x es -90.

Ingrese un entero en la variable x:=10
El entero x es 10.
*/