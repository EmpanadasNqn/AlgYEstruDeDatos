#include <stdio.h>
#include <assert.h>

int pedir_entero(char name){
    int x;
    printf("Ingrese un entero en la variable %c:=",name);
    scanf("%d",&x);
    return x;
}

void imprimir_entero(char name, int x){
    printf("El entero %c es %d.\n",name,x);
}


int suma_hasta(int n) {
    int aux = 0;
    int i = 1;

    while (i <= n){
        aux = aux + i;
        i = i + 1;
    }

    return aux;
}

int main() {
    int n = pedir_entero('n');
    
    assert(n > 0);

    int n0 = suma_hasta(n);

    assert(n0 > 0);

    printf("La suma de los primeros %d naturales incluyendo a %d es %d\n",n,n,n0);
    
    return 0;
}

/*
Ingrese un entero en la variable n:=1
La suma de los primeros 1 naturales incluyendo a 1 es 1

Ingrese un entero en la variable n:=0
exSumaHasta: suma_hasta.c:31: main: Assertion `n > 0' failed.
Abortado (`core' generado)

Ingrese un entero en la variable n:=5
La suma de los primeros 5 naturales incluyendo a 5 es 15
*/