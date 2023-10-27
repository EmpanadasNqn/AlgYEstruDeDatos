#include <stdio.h>
#include <limits.h>
#include <assert.h>
#include <stdbool.h>

int pedir_entero(char name){
    int x;
    printf("Ingrese un entero en la variable %c:=",name);
    scanf("%d",&x);
    printf("\n");
    return x;
}

int pedir_tamañoArreglo(char name) {
    int tam;
    printf("Ingrese el tamaño de su arreglo %c :=",name);
    scanf("%d",&tam);
    printf("\n");
    return tam;
}

void pedir_arreglo(int tam, int a[]) {
    int i = 0;

    while (i < tam){
        printf("Ingrese, en la posicion %d del arreglo, el entero :=",i);
        scanf("%d",&a[i]);
        i = i + 1;
    }
    printf("\n");
}

bool todos_pares(int tam, int a[]) {
    int i = 0;
    bool res = true;

    while (i < tam) {

        if (a[i] % 2 != 0) {
            res = false;
        }
        i = i + 1;
    }
    
    return res;
}

bool todos_impares(int tam, int a[]) {
    int i = 0;
    bool res = true;

    while (i < tam) {

        if (a[i] % 2 == 0) {
            res = false;
        }
        i = i + 1;
    }
    
    return res;
}

int minimo_pares(int tam, int a[]) {
    int i = 0;
    int res = INT_MAX;

    while (i < tam) {
        if(a[i] < res && a[i] % 2 == 0) {
            res = a[i];
        }
        i = i + 1;
    }

    return res;
}

int minimo_impares(int tam, int a[]) {
    int i = 0;
    int res = INT_MAX;

    while (i < tam) {
        if (a[i] < res && a[i] % 2 != 0) {
            res = a[i];
        }
        i = i + 1;
    }
    
    return res;
}

int minimo(int a, int b) {
    if (a > b) {
        a = b;
    }
    return a;
}

int main() {

    int tam = pedir_tamañoArreglo('a');
    int a[tam];
    int min, minPar, minImpar;

    pedir_arreglo(tam, a);

    minPar = minimo_pares(tam, a);
    minImpar = minimo_impares(tam, a);
    min = minimo(minPar, minImpar);
    
    if (todos_pares(tam, a)) {
        printf("Todos los elementos del arreglo son Par.\nY el minimo es %d.\n",minPar);
    } else if (todos_impares(tam, a)) {
        printf("Todos los elementos del arreglo son ImPar.\nY el minimo es %d.\n",minImpar);
    } else {
        printf("El elemento Par Minimo del arreglo es %d, y el Impar Minimo es %d.\n",minPar,minImpar);
        printf("Y el elemento minimo del arreglo es %d.\n",min);
    }

    return 0;
}

/*
Ingrese el tamaño de su arreglo a :=3

Ingrese, en la posicion 0 del arreglo, el entero :=4
Ingrese, en la posicion 1 del arreglo, el entero :=8
Ingrese, en la posicion 2 del arreglo, el entero :=2

Todos los elementos del arreglo son Par.
Y el minimo es 2.

Ingrese el tamaño de su arreglo a :=3

Ingrese, en la posicion 0 del arreglo, el entero :=7
Ingrese, en la posicion 1 del arreglo, el entero :=9
Ingrese, en la posicion 2 del arreglo, el entero :=5

Todos los elementos del arreglo son ImPar.
Y el minimo es 5.

Ingrese el tamaño de su arreglo a :=3

Ingrese, en la posicion 0 del arreglo, el entero :=4
Ingrese, en la posicion 1 del arreglo, el entero :=7
Ingrese, en la posicion 2 del arreglo, el entero :=9

El elemento Par Minimo del arreglo es 4, y el Impar Minimo es 7.
Y el elemento minimo del arreglo es 4.

Ingrese el tamaño de su arreglo a :=3

Ingrese, en la posicion 0 del arreglo, el entero :=9
Ingrese, en la posicion 1 del arreglo, el entero :=10
Ingrese, en la posicion 2 del arreglo, el entero :=11

El elemento Par Minimo del arreglo es 10, y el Impar Minimo es 9.
Y el elemento minimo del arreglo es 9.
*/