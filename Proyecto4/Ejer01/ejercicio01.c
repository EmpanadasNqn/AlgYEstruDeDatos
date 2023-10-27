#include <stdio.h>
#include <assert.h>

int pedir_entero(char name){
    int x;
    printf("Ingrese un entero en la variable %c:=",name);
    scanf("%d",&x);   
    return x;
}

void hola_hasta(int n){
    int i = 0;
    while (i < n){
        printf("Hola\n");
        i = i + 1;
    }
}

int main(){
    int x = pedir_entero('x');
    assert(x > 0);

    hola_hasta(x);

    return 0;
}

/*
Ingrese un entero en la variable x:=3
Hola
Hola
Hola

Ingrese un entero en la variable x:=0
Ex01: Ejercicio01.c:22: main: Assertion `x > 0' failed.
Abortado (`core' generado)

Ingrese un entero en la variable x:=-3
Ex01: Ejercicio01.c:22: main: Assertion `x > 0' failed.
Abortado (`core' generado)
*/