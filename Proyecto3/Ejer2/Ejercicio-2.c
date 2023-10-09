#include <stdio.h>
#include <stdbool.h>

int main(){
    int x, y, z;
    bool b, w;
    
    printf("Ingrese el valor de b, w (Booleanos):\n");
    printf("b:=");
    scanf("%d",&x);
    b = x;
    printf("w:=");
    scanf("%d",&x);
    w = x;

    printf("Ingrese los valores de x, y, z:\n");
    printf("x:=");
    scanf("%d",&x);
    printf("y:=");
    scanf("%d",&y);
    printf("z:=");
    scanf("%d",&z);

    bool r1, r2, r3;

    r1 = x % 4 == 0;
    r2 = x + y == 0 && y - x == (-1) * z;
    r3 =  !b && w;

    printf("\n(x mod 4 == 0) = %d\n",r1);
    printf("(x + y == 0 && y - x == (-1) * z) = %d\n",r2);
    printf("(not b && w) = %d\n",r3);

    return 0;
}

/*
Para el Estado {x:=0, y:=0, z:=0, b:=True, w:=True} los resultados quedan True, True y False:
    
Ingrese el valor de b, w (Booleanos):
b:=1
w:=1
Ingrese los valores de x, y, z:
x:=0
y:=0
z:=0

(x mod 4 == 0) = 1
(x + y == 0 && y - x == (-1) * z) = 1
(not b && w) = 0

Para el Estado {x:=1, y:=0, z:=0, b:=False, w:=True} los resultados quedan False, False y True:
   
Ingrese el valor de b, w (Booleanos):
b:=0
w:=1
Ingrese los valores de x, y, z:
x:=1
y:=0
z:=0

(x mod 4 == 0) = 0
(x + y == 0 && y - x == (-1) * z) = 0
(not b && w) = 1
*/