#include <stdio.h>

int main(){

    int x;

    printf("Programa 1.a\n");
    printf("Ingrese el valor de x:=");
    scanf("%d",&x);
    x = 5;
    printf("x es %d\n",x);

    /*
    Programa 1.a
    Ingrese el valor de x:=1
    x es 5

    Programa 1.a
    Ingrese el valor de x:=6
    x es 5

    Programa 1.a
    Ingrese el valor de x:=3
    x es 5
    */

    return 0;
}