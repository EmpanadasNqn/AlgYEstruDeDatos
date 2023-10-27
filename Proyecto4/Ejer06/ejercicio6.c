#include <stdio.h>

int pedir_entero(){
    int x;
    printf("Ingrese la longitud del arreglo :=");
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

void imprimir_arreglo(int n_max, int a[]) {
    int i = 0;

    while (i < n_max){
        printf("El valor del vector en la posicion %d es %d.\n",i,a[i]);
        i = i + 1;
    }   
}

int main() {
    int n_max = pedir_entero();
    int a[n_max];

    pedir_arreglo(n_max, a);
    imprimir_arreglo(n_max, a);

    return 0;
}