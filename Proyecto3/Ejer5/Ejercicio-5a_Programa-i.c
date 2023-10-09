#include <stdio.h>

int main(){
    int i;

    printf("Programa 1.i\n");
    printf("Ingrese la variable i:=");
    scanf("%d",&i);

    while (i!=0){
        printf("En el do i es %d\n",i);
        i=0;
        printf("Ahora, i es %d\n",i);
    }
    
    printf("El valor final de i es %d\n",i);

    return 0;
}

/* En el caso del Programa 1.i tambien es necesario usar un while ya que su condicion esta
al principio.*/

/*
Programa 1.i
Ingrese la variable i:=400
En el do i es 400
Ahora, i es 0
El valor final de i es 0

Programa 1.i
Ingrese la variable i:=0
El valor final de i es 0

Programa 1.i
Ingrese la variable i:=-10
En el do i es -10
Ahora, i es 0
El valor final de i es 0
*/