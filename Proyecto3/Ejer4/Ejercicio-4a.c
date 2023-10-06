#include <stdio.h>

int main(){
    
    int x, y;

    printf("Ingrese el valor x:=");
    scanf("%d",&x);
    printf("Ahora el valor de y:=");
    scanf("%d",&y);

    if (x>=y){
        x=0;
    } else if (x<=y){
        x=2;
    }
    printf("x es %d\n",x);
    printf("y es %d\n",y);

    return 0;
}

/*
Ingrese el valor x:=3 
Ahora el valor de y:=1
x es 0
y es 1

Ingrese el valor x:=1
Ahora el valor de y:=3
x es 2
y es 3

Ingrese el valor x:=3
Ahora el valor de y:=3
x es 0
y es 3
*/