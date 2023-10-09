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
    int x;

    x = pedir_entero('x');
    x = 5;
    imprimir_entero('x',x);

    return 0;
}

/*
Ingrese un entero en la variable x:=1
El entero x es 5.

Ingrese un entero en la variable x:=10
El entero x es 5.

Ingrese un entero en la variable x:=99
El entero x es 5.
*/