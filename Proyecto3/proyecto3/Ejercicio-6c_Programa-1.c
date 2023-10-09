#include <stdio.h>
#include <stdbool.h>

int pedir_entero(char name){
    int x;

    printf("Ingrese un entero en la variable %c:=",name);
    scanf("%d",&x);
    
    return x;
}

int main(){
    int x, y, z;
    bool r3, r5;

    x = pedir_entero('x');
    y = pedir_entero('y');
    z = pedir_entero('z');

    r3 = y - 2 == (x * 3 + 1) % 5;
    r5 = y < x * z;

    printf("x + y + 1 = %d\n",x+y+1);
    printf("z * z + y * 45 - 15 * x = %d\n",z*z+y*45-15*x);
    printf("y - 2 == (x * 3 + 1) 'mod' 5 = %d\n",r3);
    printf("y / 2 * x = %d\n",y/2*x);
    printf("y < x * z = %d\n",r5);

    return 0;
}

/*
Ingrese un entero en la variable x:=7
Ingrese un entero en la variable y:=3
Ingrese un entero en la variable z:=5
x + y + 1 = 11
z * z + y * 45 - 15 * x = 55
y - 2 == (x * 3 + 1) 'mod' 5 = 0
y / 2 * x = 7
y < x * z = 1

Ingrese un entero en la variable x:=1
Ingrese un entero en la variable y:=10
Ingrese un entero en la variable z:=8
x + y + 1 = 12
z * z + y * 45 - 15 * x = 499
y - 2 == (x * 3 + 1) 'mod' 5 = 0
y / 2 * x = 5
y < x * z = 0
*/