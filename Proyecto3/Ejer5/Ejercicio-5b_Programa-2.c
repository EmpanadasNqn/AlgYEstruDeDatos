#include <stdio.h>
#include <stdbool.h>

int main(){

    printf("Programa 2.\n");

    int x, i;
    bool res;

    printf("Ingrese el valor x:=");
    scanf("%d",&x);

    i=2;
    res=true;

    while (i<x && res){
        res = res && ((x%i)!=0);
        i=i+1;
        printf("x es %d, i es %d, res es %d.\n",x,i,res);
    }
    
    return 0;
}

/*Uso el while en vez del do while ya que el enunciado tiene la condicion
al principio y no al final.*/

/*Este programa determina si el numero ingresado a x es par o impar.*/

/*
Programa 2.
Ingrese el valor x:=5
x es 5, i es 3, res es 1.
x es 5, i es 4, res es 1.
x es 5, i es 5, res es 1.

Programa 2.
Ingrese el valor x:=4
x es 4, i es 3, res es 0.

Programa 2.
Ingrese el valor x:=8 
x es 8, i es 3, res es 0.
*/