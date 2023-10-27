#include <stdio.h>
#include <stdbool.h>

int pedir_entero(char name){
    int x;
    printf("Ingrese un entero en la variable %c:=",name);
    scanf("%d",&x);
    return x;
}

void pedir_arreglo(int n_max, int a[]) {
    int i = 0;

    while (i < n_max){
        printf("Ingrese, en la posicion %d del vector, el entero :=",i);
        scanf("%d",&a[i]);
        i = i + 1;
    }
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

bool existe_multiplo(int m, int tam, int a[]) {
    int i = 0;
    bool res = false;
    while (i < tam) {
        if (a[i] % m == 0) {
            res = true;
        }
        i = i + 1;
    }
    
    return res;
}

int main() {
    int tam = pedir_entero('t');
    int a[tam];
    int funcion, m;

    pedir_arreglo(tam, a); 

    printf("\nPresione 1 para ver si los Elementos de su arreglo son Par.\nPresione 2 para ver si hay algun elemento de su arreglo multiplo de un numero que usted elija.\n");
    printf("Elija := ");
    scanf("%d",&funcion);

    if (funcion == 1) {

        if (todos_pares(tam, a)) {
            printf("\nTodos los elementos de su arreglo son Par.\n");
        } else {
            printf("\nNo todos los elementos de su arreglo son Par.\n");
        }

    } else if (funcion == 2) {
        printf("\nIngrese un entero para buscar si el arreglo tiene multiplos :=");
        scanf("%d",&m);

        if (existe_multiplo(m, tam, a)) {
            printf("\nExiste un multiplo de %d en el Arreglo.\n",m);
        } else {
            printf("\nNo existe un multiplo de %d en el Arreglo.\n",m);
        }

    }
    
    return 0;
}

/*
Ingrese un entero en la variable t:=3
Ingrese, en la posicion 0 del vector, el entero :=1
Ingrese, en la posicion 1 del vector, el entero :=2
Ingrese, en la posicion 2 del vector, el entero :=3

Presione 1 para ver si los Elementos de su arreglo son Par.
Presione 2 para ver si hay algun elemento de su arreglo multiplo de un numero que usted elija.
Elija := 1

No todos los elementos de su arreglo son Par.

Ingrese un entero en la variable t:=3
Ingrese, en la posicion 0 del vector, el entero :=2
Ingrese, en la posicion 1 del vector, el entero :=2
Ingrese, en la posicion 2 del vector, el entero :=2

Presione 1 para ver si los Elementos de su arreglo son Par.
Presione 2 para ver si hay algun elemento de su arreglo multiplo de un numero que usted elija.

Elija := 1

Todos los elementos de su arreglo son Par.

Ingrese un entero en la variable t:=3
Ingrese, en la posicion 0 del vector, el entero :=4
Ingrese, en la posicion 1 del vector, el entero :=8
Ingrese, en la posicion 2 del vector, el entero :=6

Presione 1 para ver si los Elementos de su arreglo son Par.
Presione 2 para ver si hay algun elemento de su arreglo multiplo de un numero que usted elija.
Elija := 2

Ingrese un entero para buscar si el arreglo tiene multiplos :=2

Existe un multiplo de 2 en el Arreglo.

Ingrese un entero en la variable t:=3
Ingrese, en la posicion 0 del vector, el entero :=4
Ingrese, en la posicion 1 del vector, el entero :=8
Ingrese, en la posicion 2 del vector, el entero :=9

Presione 1 para ver si los Elementos de su arreglo son Par.
Presione 2 para ver si hay algun elemento de su arreglo multiplo de un numero que usted elija.
Elija := 2

Ingrese un entero para buscar si el arreglo tiene multiplos :=2

Existe un multiplo de 2 en el Arreglo.

Ingrese un entero en la variable t:=3
Ingrese, en la posicion 0 del vector, el entero :=3
Ingrese, en la posicion 1 del vector, el entero :=5
Ingrese, en la posicion 2 del vector, el entero :=7

Presione 1 para ver si los Elementos de su arreglo son Par.
Presione 2 para ver si hay algun elemento de su arreglo multiplo de un numero que usted elija.
Elija := 2

Ingrese un entero para buscar si el arreglo tiene multiplos :=2

No existe un multiplo de 2 en el Arreglo.
*/