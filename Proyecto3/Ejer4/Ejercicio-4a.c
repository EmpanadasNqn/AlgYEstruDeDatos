#include <stdio.h>

int main(){
    int x, y;

    printf("Ingrese el valor x:=");
    scanf("%d",&x);
    printf("Ahora el valor y:=");
    scanf("%d",&y);

    if (x>=y){
        x=0;
    } else if (x<=y){
        x=2;
    }
    
    printf("x es %d, y es %d\n",x,y);

    return 0;
}

/*
Programa 1.e
Ingrese el valor x:=3
Ahora el valor y:=1
x es 0, y es 1

Programa 1.f
Ingrese el valor x:=-100
Ahora el valor y:=1
x es 2, y es 1

Ingrese el valor x:=10
Ahora el valor y:=10
x es 0, y es 10
*/