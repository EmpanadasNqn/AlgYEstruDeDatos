#include <stdio.h>

#define Hola 5 //Declaracion de constante

int main(){
    int x[5];
    int i = 0;

    x[0] = 15;
    x[1] = 10;
    x[2] = 5;
    x[3] = 0;
    x[4] = -5;

    while (i < 5){
        printf("El arreglo x en la posicion %d es %d\n",i,x[i]);
        i = i + 1;
    }
    
    printf("Hola es %d\n",Hola);

    return 0;
}