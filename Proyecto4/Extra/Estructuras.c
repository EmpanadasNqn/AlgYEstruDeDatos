#include <stdio.h>

struct par{
    int fst;
    int scd;
};

typedef struct {
    int uno;
    int dos;
} pares;

typedef char letra;

int main(void){
    struct par dupla;
    pares dobles;
    int x, y, z, w;
    letra a = 'A';

    dupla.fst = 0;
    dupla.scd = 5;
    dobles.uno = 10;
    dobles.dos = 15;

    x = dupla.fst;
    y = dupla.scd;
    z = dobles.uno;
    w = dobles.dos;

    printf("x es %d\n",x);
    printf("y es %d\n",y);
    printf("z es %d\n",z);
    printf("w es %d\n",w);
    printf("La letra a es %c\n",a);
    
    return 0;
}