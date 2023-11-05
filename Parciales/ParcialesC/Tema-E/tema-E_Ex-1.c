#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

int pedirEntero(char n) {
    int x;
    printf("Ingrese un Entero en %c = ",n);
    scanf("%d",&x);
    return x;
}

void imprimirEntero(char n, int x) {
    printf("El entero %c es %d.\n",n,x);
}

bool pedirBooleano(char n) {
    int x;
    printf("Ingrese un Booleano en %c = ",n);
    scanf("%d",&x);
    bool y = x;
    return y;
}

void imprimirBooleano(char n, bool x) {
    if (x) {
        printf("El booleano %c es True.\n",n);
    } else {
        printf("El booleano %c es Fasle.\n",n);
    }
}

int main(void){
    int x, X, y, Y;
    bool z, Z;

    x = pedirEntero('x');
    y = pedirEntero('y');
    z = pedirBooleano('z');

    X = x, Y = y, Z = z;

    assert(x == X && y == Y && z == Z && X > 0);

    x = X * X + Y * Y;
    y = X + Y;
    z = X > Y;

    assert(x == X * X + Y * Y && y == X + Y && z == (X > Y));

    imprimirEntero('x',x);
    imprimirEntero('y',y);
    imprimirBooleano('z',z);

    return 0;
}