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
    int x, y;

    x = pedir_entero('x');
    y = pedir_entero('y');

    y = y + y;
    x = x + y;

    imprimir_entero('x',x);
    imprimir_entero('y',y); 

    return 0;
}

/*
Ingrese un entero en la variable x:=2
Ingrese un entero en la variable y:=5
El entero x es 12.
El entero y es 10.

Ingrese un entero en la variable x:=5
Ingrese un entero en la variable y:=5
El entero x es 15.
El entero y es 10.

Ingrese un entero en la variable x:=90
Ingrese un entero en la variable y:=1
El entero x es 92.
El entero y es 2.
*/