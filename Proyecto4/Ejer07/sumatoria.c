#include <stdio.h>

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

int sumatoria(int tam, int a[]) {
    int i = 0;
    int res = 0;

    while (i < tam) {
        res = res + a[i];
        i = i + 1;    
    }

    return res;
}

int main() {
    int tam = pedir_entero('t');
    int a[tam];

    pedir_arreglo(tam, a);
    tam = sumatoria(tam, a);

    printf("La sumatoria del arreglo es %d.\n",tam);

    return 0;
}