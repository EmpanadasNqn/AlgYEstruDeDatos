#include <stdio.h>

int main(){

    int x, y;

    printf("Programa 1.b\n");
    printf("Ingrese el valor x:=");
    scanf("%d",&x);
    printf("Ingrese el valor y:=");
    scanf("%d",&y);
    
    x = x + y;
    y = y + y;

    printf("x es %d",x);
    printf(" ademas, y es %d\n",y);

    /*
    Programa 1.b
    Ingrese el valor x:=2
    Ingrese el valor y:=5
    x es 7 ademas, y es 10

    Programa 1.b
    Ingrese el valor x:=3
    Ingrese el valor y:=9
    x es 12 ademas, y es 18

    Programa 1.b
    Ingrese el valor x:=100
    Ingrese el valor y:=-3
    x es 97 ademas, y es -6
    */

    return 0;
}