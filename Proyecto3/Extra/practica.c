#include <stdio.h>
#include <stdbool.h>
void main(){
  
  printf("Hola Mundo\n\n");
  
  int x = 0;
  int y;
  printf("Hasta cuanto queres contar: ");
  scanf("%d",&y);
  do {
    x++;
    printf("X es %d\n",x);
  } while (x<y);

  bool z;
  printf("Ingresar un valor Booleano: ");
  scanf("%d",&x);
  z = x;
  printf("Tu valor Quedo como: %d\n\n",z);
}