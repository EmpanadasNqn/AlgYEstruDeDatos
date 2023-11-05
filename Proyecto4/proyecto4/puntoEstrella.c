#include <stdio.h>
#include <limits.h>


typedef struct _persona {
    char *nombre;
    int edad;
    float altura, peso;
} persona_t;

float peso_promedio(unsigned int longitud, persona_t arr[]) {
    float pesoPromedio = 0;
    unsigned int i = 0;

    while (i < longitud) {
        pesoPromedio = pesoPromedio + arr[i].peso;
        i = i + 1;
    }
    pesoPromedio = pesoPromedio/longitud;
    
    return pesoPromedio;
}

persona_t persona_de_mayor_edad(unsigned int longitud, persona_t arr[]) {
    unsigned int i = 0;
    persona_t pME;
    pME.edad = INT_MIN;

    while (i < longitud) {
        if (arr[i].edad > pME.edad) {
            pME.edad = arr[i].edad;
            pME.nombre = arr[i].nombre;
        }
        i = i + 1;
    }
    
    return pME;
}

persona_t persona_de_menor_altura(unsigned int longitud, persona_t arr[]) {
    unsigned int i = 0;
    persona_t pMA;
    pMA.altura = INT_MAX;

    while (i < longitud) {
        if (arr[i].altura < pMA.altura) {
            pMA.altura = arr[i].altura;
            pMA.nombre = arr[i].nombre;
        }
        i = i + 1;
    }
    
    return pMA;
}

int main(void) {
    persona_t p1 = {.nombre="Santino", .edad=19, .altura=1.80, .peso=60};
    persona_t p2 = {.nombre="Patricia", .edad=19, .altura=1.60, .peso=50};
    persona_t p3 = {.nombre="JuanPablo", .edad=47, .altura=1.78, .peso=75};
    unsigned int longitud = 3;
    persona_t arr[] = {p1, p2, p3};

    printf("El peso promedio es %f.\n",peso_promedio(longitud, arr));
    
    persona_t p = persona_de_mayor_edad(longitud, arr);
    printf("El nombre de la persona con mayor edad es %s.\n",p.nombre);

    p = persona_de_menor_altura(longitud, arr);
    printf("El nombre de la persona con menor altura es %s.\n",p.nombre);

    return 0;
}