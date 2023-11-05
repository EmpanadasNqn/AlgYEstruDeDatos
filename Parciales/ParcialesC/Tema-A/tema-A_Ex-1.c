#include <stdio.h>
#include <assert.h>

int pedir_entero(char n) {
    int x;
    printf("Ingrese un entero en %c = ",n);
    scanf("%d",&x);
    return x;
}

void mostrar_entero(char n, int x) {
    printf("El entero %c es %d.\n",n,x);
}

int main(void) {
    int r, R, s, S;
    
    //Ingreso los valores de r y s que son los mismos valores de R y S.
    r = pedir_entero('r');
    s = pedir_entero('s');
    R = r;
    S = s;

    assert(r == R && s == S && S > R);  //PreCondicion

    r = S - R;
    s = R + S;

    assert(r == S - R && s == R + S);   //PostCondicion

    //Muestro los valores de r y s.
    mostrar_entero('r',r);
    mostrar_entero('s',s);

    return 0;
}