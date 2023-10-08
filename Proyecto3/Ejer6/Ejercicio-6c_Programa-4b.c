#include <stdio.h>

int pedir_entero(char name){
    int x;

    printf("Ingrese un entero en la variable %c:=",name);
    scanf("%d",&x);
    
    return x;
}

void imprimir_entero(char name, int x){
    printf("El entero %c es %d.\n",name,x);
}

int minimo_entre_tres(int x, int y, int z){
    int m;

    if (x<y){
        m=x; 
    } else if (x>=y){
        m=y;
    }
    if (m>=z){
        m=z;
    }

    return m;
}

int main(){
    int x, y, z, m;

    x = pedir_entero('x');
    y = pedir_entero('y');
    z = pedir_entero('z');

    m = minimo_entre_tres(x,y,z);

    imprimir_entero('x',x);
    imprimir_entero('y',y);
    imprimir_entero('z',z);
    imprimir_entero('m',m);
    printf("Y es el minimo ente x,y,z.\n");

    return 0;
}

/*La ventaja de de esta nueva version es que es mas entendible a simple de leer y entender que hace.*/
/*Podria escribir una nueva funcion que busque el menor entre las variables x,y,z y la guarde en la variable m.*/

/* 
Ingrese un entero en la variable x:=5
Ingrese un entero en la variable y:=4
Ingrese un entero en la variable z:=8
El entero x es 5.
El entero y es 4.
El entero z es 8.
El entero m es 4.
Y es el minimo ente x,y,z.

Ingrese un entero en la variable x:=4
Ingrese un entero en la variable y:=5
Ingrese un entero en la variable z:=8
El entero x es 4.
El entero y es 5.
El entero z es 8.
El entero m es 4.
Y es el minimo ente x,y,z.

Ingrese un entero en la variable x:=3
Ingrese un entero en la variable y:=2
Ingrese un entero en la variable z:=1
El entero x es 3.
El entero y es 2.
El entero z es 1.
El entero m es 1.
Y es el minimo ente x,y,z.
*/