#include <stdio.h>

int main(){
    int i;

    printf("Programa 1.h\n");
    printf("Ingrese la variable i:=");
    scanf("%d",&i);

    while (i!=0){
        printf("En el do i es %d\n",i);
        i=i-1;
        printf("Ahora, i-1 es %d\n",i);
    }

    printf("El valor final de i es %d\n",i);

    return 0;
}

/*En el enunciado del programa 1.h dice de usar el do con la condicion al principio.
Pero en C el do tiene su condicion en un while al final. por lo que para que funcione
como en el enunciado del programa 1.h, hay que usar un while ya que tiene la condicion
al principio.*/

/*
Programa 1.h
Ingrese la variable i:=3
En el do i es 3
Ahora, i-1 es 2
En el do i es 2
Ahora, i-1 es 1
En el do i es 1
Ahora, i-1 es 0
El valor final de i es 0

Programa 1.h
Ingrese la variable i:=1
En el do i es 1
Ahora, i-1 es 0
El valor final de i es 0

Programa 1.h
Ingrese la variable i:=0
El valor final de i es 0
*/