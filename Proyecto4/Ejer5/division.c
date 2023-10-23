#include <stdio.h>
#include <assert.h>

int pedir_entero(char name){
    int x;
    printf("Ingrese un entero en la variable %c:=",name);
    scanf("%d",&x);
    return x;
}

struct div_t {
    int cociente;
    int resto;
};  

struct div_t division(int x, int y) {
    struct div_t d;
    d.cociente = x/y;
    d.resto = x%y;
    return d;
};


int main() {
    int x = pedir_entero('x');
    int y = pedir_entero('y');

    assert(y > 0 && x >= 0);

    struct div_t resultado;

    resultado = division(x,y);
    printf("La division entre %d/%d. Deja Resto %d y Cociente %d.\n",x,y,resultado.resto,resultado.cociente);

    return 0;
}

/*
Ingrese un entero en la variable x:=1
Ingrese un entero en la variable y:=2
La division entre 1/2. Deja Resto 1 y Cociente 0.

Ingrese un entero en la variable x:=9
Ingrese un entero en la variable y:=5
La division entre 9/5. Deja Resto 4 y Cociente 1.

Ingrese un entero en la variable x:=100
Ingrese un entero en la variable y:=3
La division entre 100/3. Deja Resto 1 y Cociente 33.
*/