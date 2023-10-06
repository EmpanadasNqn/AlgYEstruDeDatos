#include <stdio.h>

int main(){

    int x;

    printf("Programa 1.a\n");
    printf("Ingrese el valor de x:=");
    scanf("%d",&x);
    x = 5;
    printf("x es %d\n",x);

    return 0;
}

/*
Programa 1.a
Ingrese el valor de x:=1
x es 5

Programa 1.a
Ingrese el valor de x:=10
x es 5

Programa 1.a
Ingrese el valor de x:=99
x es 5
*/