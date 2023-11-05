#include <stdio.h>
#include <assert.h> //Evalua el cumplimiento del predicado que se le da como argumento y si no se cumple, se aborta el programa.

int main(void){
    int x, xInput;

    printf("Ingrese un entero positivo x:=");
    scanf("%d",&xInput);

    x = xInput;

    assert(xInput > 0 && x == xInput);

    while (x < 10){
        x = x + 1;
    }
    
    assert(x >= 10);

    printf("x es %d\n",x);

    return 0;
}