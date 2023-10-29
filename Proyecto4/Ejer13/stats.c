#include <stdio.h>
#include <assert.h>
#include <limits.h>
#define Tam 5

void pedir_arreglo_esp(int tam, float a[]) {
    int i = 0;

    while (i < tam){
        printf("Ingrese, en la posicion %d del arreglo, el entero :=",i);
        scanf("%f",&a[i]);
        i = i + 1;
    }
    printf("\n");
}

typedef struct {
    float maximo, minimo, promedio;
} datos_t;

datos_t stats(int tam, float a[]) {
    assert(a[0]);
    
    datos_t info;
    info.maximo = INT_MIN;
    info.minimo = INT_MAX;
    int i = 0;
    float sum = 0;

    while (i < tam) {
        if (info.maximo < a[i]) {
            info.maximo = a[i];
        } 
        if (info.minimo > a[i]) {
            info.minimo = a[i];
        }
        sum = sum + a[i];
        i = i + 1;
    }

    info.promedio = sum/tam;
    
    return info;
}

int main() {
    float a[Tam];
    datos_t info;

    pedir_arreglo_esp(Tam, a);
    info = stats(Tam, a);

    printf("El Minimo del arreglo es %f.\nEl Maximo del arreglo es %f.\nEl Promedio de los elementos del arreglo es %f.\n",info.minimo,info.maximo,info.promedio);
    return 0;
}

/*
Ingrese, en la posicion 0 del arreglo, el entero :=3.5
Ingrese, en la posicion 1 del arreglo, el entero :=4.5
Ingrese, en la posicion 2 del arreglo, el entero :=7.5      
Ingrese, en la posicion 3 del arreglo, el entero :=8.5
Ingrese, en la posicion 4 del arreglo, el entero :=1.5

El Minimo del arreglo es 1.500000.
El Maximo del arreglo es 8.500000.
El Promedio de los elementos del arreglo es 5.100000.

Ingrese, en la posicion 0 del arreglo, el entero :=5.43 
Ingrese, en la posicion 1 del arreglo, el entero :=6.345
Ingrese, en la posicion 2 del arreglo, el entero :=8.33
Ingrese, en la posicion 3 del arreglo, el entero :=3.5456
Ingrese, en la posicion 4 del arreglo, el entero :=5.0

El Minimo del arreglo es 3.545600.
El Maximo del arreglo es 8.330000.
El Promedio de los elementos del arreglo es 5.730120.

Ingrese, en la posicion 0 del arreglo, el entero :=9.999999
Ingrese, en la posicion 1 del arreglo, el entero :=4.3
Ingrese, en la posicion 2 del arreglo, el entero :=5.2
Ingrese, en la posicion 3 del arreglo, el entero :=1.1
Ingrese, en la posicion 4 del arreglo, el entero :=0.0000001

El Minimo del arreglo es 0.000000.
El Maximo del arreglo es 9.999999.
El Promedio de los elementos del arreglo es 4.120000.
*/