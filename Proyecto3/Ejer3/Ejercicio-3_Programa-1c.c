#include <stdio.h>

int main(){

    int x, y;

    printf("Programa 1.c\n");
    printf("Ingrese el valor x:=");
    scanf("%d",&x);
    printf("Ingrese el valor y:=");
    scanf("%d",&y);

    y = y + y;
    x = x + y;

    printf("y es %d",y);
    printf(", x es %d\n",x);

    return 0;
}

/*
Programa 1.c
Ingrese el valor x:=2
Ingrese el valor y:=5
y es 10, x es 12

Programa 1.c
Ingrese el valor x:=5       
Ingrese el valor y:=5
y es 10, x es 15

Programa 1.c
Ingrese el valor x:=90
Ingrese el valor y:=1
y es 2, x es 92
*/