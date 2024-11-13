/*╔════════════════════════════════════════════════════════════════════╗
║                    TECNOLÓGICO NACIONAL DE MÉXICO                 ║
║                     INSTITUTO TECNOLÓGICO DE TIJUANA              ║
╠════════════════════════════════════════════════════════════════════╣
║                   Carrera: Ingeniería en Sistemas                 ║
║                   Nombre: Lennyn Alejandro Castillejo Robles      ║
║                   Matrícula: 22210880                             ║
║                   Materia: INTERFAZ DE USUARIO                   ║
║                                                                 ║
╠════════════════════════════════════════════════════════════════════╣
║                           Septiembre 2024                         ║
╚════════════════════════════════════════════════════════════════════*/

#include <stdio.h>

// Declaración de la función en ensamblador
extern int sum_array(int *array, int size);

int main() {
    int size;

    // Solicitar el tamaño del arreglo
    printf("Ingrese el tamaño del arreglo: ");
    scanf("%d", &size);

    int array[size];

    // Solicitar los elementos del arreglo
    printf("Ingrese los elementos del arreglo:\n");
    for (int i = 0; i < size; i++) {
        printf("Elemento %d: ", i);
        scanf("%d", &array[i]);
    }

    // Llamar a la función en ensamblador para calcular la suma
    int result = sum_array(array, size);

    // Imprimir el resultado
    printf("La suma de los elementos del arreglo es: %d\n", result);

    return 0;
}
