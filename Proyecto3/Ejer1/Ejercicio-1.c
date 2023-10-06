#include <stdio.h>
#include <stdbool.h>

int main(){
  int x, z;
  float y;
  printf("Ingrese los valores de x, y, z:\n");
  printf("x:=");
  scanf("%d",&x);
  printf("y:=");
  scanf("%f",&y);
  printf("z:=");
  scanf("%d",&z);  
  
  int r1, r2;
  float r4;
  bool r3, r5;
  r1 = x + y + 1;
  r2 = z * z + y * 45 - 15 * x;
  r3 = y - 2 == (x * 3 + 1) % 5;
  r4 = y / 2 * x;
  r5 = y < x * z;

  printf("x + y + 1 = %d\n",r1);
  printf("z * z + y * 45 - 15 * x = %d\n",r2);
  printf("y - 2 == (x * 3 + 1) 'mod' 5 = %d\n",r3);
  printf("y / 2 * x = %f\n",r4);
  printf("y < x * z = %d\n",r5);
  
  /*Para el Estado {x:=7, y:=3, z:=5} los resultados quedan:

  Ingrese los valores de x, y, z:
  x:=7
  y:=3
  z:=5
  x + y + 1 = 11
  z * z + y * 45 - 15 * x = 55
  y - 2 == (x * 3 + 1) 'mod' 5 = 0
  y / 2 * x = 10.500000
  y < x * z = 1
  */

  /*Para el Estado {x:=1, y:=10, z:=8} los resultados quedan:

  Ingrese los valores de x, y, z:
  x:=1
  y:=10
  z:=8
  x + y + 1 = 12
  z * z + y * 45 - 15 * x = 499
  y - 2 == (x * 3 + 1) 'mod' 5 = 0
  y / 2 * x = 5.000000
  y < x * z = 0
  */

  /*La ultima expresion tiene de resultado el tipo Bool, 
  pero que en C se representa como 0 = False y "Cualquier numero diferente a 0" = True*/
  
  return 0;
}