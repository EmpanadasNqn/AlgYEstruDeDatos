#include <stdio.h>

int main(){

    int x, y, z, m;

    printf("Ingrese el valor x:=");
    scanf("%d",&x);
    printf("Ingrese el valor y:=");
    scanf("%d",&y);
    printf("Ingrese el valor z:=");
    scanf("%d",&z);
    printf("Ingrese el valor m:=");
    scanf("%d",&m);

    if (x<y){
        m=x; 
    } else if (x>=y){
        m=y;
    }

    printf("x es %d, y es %d, z es %d, m es %d.\n",x,y,z,m);

    if (m>=z){
        m=z;
    }

    printf("x es %d, y es %d, z es %d.\nFinalmente m es %d.\n",x,y,z,m);    

    return 0;
}

/*Este Programa te devuelve el valor minimo entre las variables x,y,z guardado este minimo 
en la variable m.*/

/*
Ingrese el valor x:=5
Ingrese el valor y:=4
Ingrese el valor z:=8
Ingrese el valor m:=0
x es 5, y es 4, z es 8, m es 4.
x es 5, y es 4, z es 8.
Finalmente m es 4.

Ingrese el valor x:=5
Ingrese el valor y:=4
Ingrese el valor z:=8
Ingrese el valor m:=9
x es 5, y es 4, z es 8, m es 4.
x es 5, y es 4, z es 8.
Finalmente m es 4.

Ingrese el valor x:=5
Ingrese el valor y:=4
Ingrese el valor z:=1
Ingrese el valor m:=0
x es 5, y es 4, z es 1, m es 4.
x es 5, y es 4, z es 1.
Finalmente m es 1.
*/