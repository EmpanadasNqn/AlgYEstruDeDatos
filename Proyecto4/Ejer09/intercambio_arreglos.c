#include <stdio.h>
#include <assert.h>

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

void pedir_arreglo(int n_max, int a[]) {
    int i = 0;

    while (i < n_max){
        printf("Ingrese, en la posicion %d del arreglo, el entero :=",i);
        scanf("%d",&a[i]);
        i = i + 1;
    }
    printf("\n");
}

void imprimir_arreglo(int n_max, int a[]) {
    int i = 0;

    while (i < n_max){
        printf("\nEl valor del arreglo en la posicion %d es %d.",i,a[i]);
        i = i + 1;
    }
    printf("\n");
}

void intercambiar(int tam, int a[], int i, int j) {
    assert(i >= 0 && i < tam && j >= 0 && j < tam && i != j);
    int aux = a[i];
    a[i] = a[j];
    a[j] = aux;
}

int main() {
    int tam = pedir_tamañoArreglo('a');
    int a[tam], i ,j;
    
    pedir_arreglo(tam, a);

    printf("Intercambiar posicion :=");
    scanf("%d",&i);
    printf("Por la :=");
    scanf("%d",&j);

    intercambiar(tam, a, i, j);
    imprimir_arreglo(tam, a);

    return 0;
}

/*
Ingrese el tamaño de su arreglo a :=3

Ingrese, en la posicion 0 del arreglo, el entero :=1
Ingrese, en la posicion 1 del arreglo, el entero :=2
Ingrese, en la posicion 2 del arreglo, el entero :=3

Intercambiar posicion :=0
Por la :=2

El valor del arreglo en la posicion 0 es 3.
El valor del arreglo en la posicion 1 es 2.
El valor del arreglo en la posicion 2 es 1.

Ingrese el tamaño de su arreglo a :=3

Ingrese, en la posicion 0 del arreglo, el entero :=2
Ingrese, en la posicion 1 del arreglo, el entero :=1
Ingrese, en la posicion 2 del arreglo, el entero :=2

Intercambiar posicion :=1
Por la :=0

El valor del arreglo en la posicion 0 es 1.
El valor del arreglo en la posicion 1 es 2.
El valor del arreglo en la posicion 2 es 2.

Ingrese el tamaño de su arreglo a :=3

Ingrese, en la posicion 0 del arreglo, el entero :=2  
Ingrese, en la posicion 1 del arreglo, el entero :=2
Ingrese, en la posicion 2 del arreglo, el entero :=1

Intercambiar posicion :=2
Por la :=0

El valor del arreglo en la posicion 0 es 1.
El valor del arreglo en la posicion 1 es 2.
El valor del arreglo en la posicion 2 es 2.
*/