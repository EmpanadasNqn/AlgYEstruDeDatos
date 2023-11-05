#include <stdio.h>
#include <assert.h>

int pedirEntero(char n){
    int x;
    printf("Ingrese un Entero en %c = ",n);
    scanf("%d",&x);
    return x;
}

void imprimirEntero(char n, int x){
    printf("El entero %c = %d.\n",n,x);
}

int main(void){
    int x, X, y, Y, z, Z;
    
    x = pedirEntero('x');
    y = pedirEntero('y');
    z = pedirEntero('z');

    X = x, Y = y, Z = z;

    assert(x == X && y == Y && z == Z && X != 0);

    x = 2 * Y + X;
    y = Z + X;
    z = Y / X;

    assert(x == 2 * Y + X && y == Z + X && z == Y / X);

    imprimirEntero('x',x);
    imprimirEntero('y',y);
    imprimirEntero('z',z);

    return 0;
}