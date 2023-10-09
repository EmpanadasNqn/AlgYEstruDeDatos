#include <stdio.h>

void imprimir_hola(){
    printf("Hola\n");
}

void imprimir_chau(){
    printf("Chau\n");
}

int main(){
    imprimir_hola();
    imprimir_hola();
    imprimir_chau();
    imprimir_chau();
    
    return 0;
}

/*
Hola
Hola
Chau
Chau
*/