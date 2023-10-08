#include <stdio.h>

int main(){

    printf("Programa 1.\n");

    int x, y, i;

    printf("Ingrese el valor x:=");
    scanf("%d",&x);
    printf("Ingrese el valor y:=");
    scanf("%d",&y);

    i=0;

    while (x>=y){
        x=x-y;
        i=i+1;
        printf("x es %d, y es %d, i es %d.\n",x,y,i);
    }
    
    return 0;
}

/*Uso el while en vez del do while ya que el enunciado tiene la condicion
al principio y no al final.*/

/*Este programa resta y a x hasta que x sea menor que y.*/

/*
Programa 1.
Ingrese el valor x:=13
Ingrese el valor y:=3
x es 10, y es 3, i es 1.
x es 7, y es 3, i es 2.
x es 4, y es 3, i es 3.
x es 1, y es 3, i es 4.

Programa 1.
Ingrese el valor x:=5
Ingrese el valor y:=1
x es 4, y es 1, i es 1.
x es 3, y es 1, i es 2.
x es 2, y es 1, i es 3.
x es 1, y es 1, i es 4.
x es 0, y es 1, i es 5.

Programa 1.
Ingrese el valor x:=10
Ingrese el valor y:=5
x es 5, y es 5, i es 1.
x es 0, y es 5, i es 2.
*/