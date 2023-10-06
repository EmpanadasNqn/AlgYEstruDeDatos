#include <stdio.h>

int main(){

    int x, y;

    printf("Programa 1.f\n");
    printf("Ingrese el valor x:=");
    scanf("%d",&x);
    printf("Ahora el valor y:=");
    scanf("%d",&y);

    if (x>=y){
        x=0;
    } else if (x<=y){
        x=2;
    }
    printf("x es %d",x);
    printf(", y es %d\n",y);
    
    return 0;
}

/*
Programa 1.f
Ingrese el valor x:=-100
Ahora el valor y:=1
x es 2, y es 1

Programa 1.f
Ingrese el valor x:=0
Ahora el valor y:=5
x es 2, y es 5

Programa 1.f
Ingrese el valor x:=8
Ahora el valor y:=8
x es 0, y es 8
*/