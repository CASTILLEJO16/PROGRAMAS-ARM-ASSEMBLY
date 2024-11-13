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
extern void rotate_array(int *array, int size, int positions, int direction);

int main() {
    int size, positions, direction;

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

    // Solicitar la cantidad de posiciones y la dirección de rotación
    printf("Ingrese la cantidad de posiciones para rotar: ");
    scanf("%d", &positions);
    printf("Ingrese la dirección de la rotación (0 = izquierda, 1 = derecha): ");
    scanf("%d", &direction);

    // Llamar a la función en ensamblador para rotar el arreglo
    rotate_array(array, size, positions, direction);

    // Imprimir el arreglo rotado
    printf("Arreglo rotado:\n");
    for (int i = 0; i < size; i++) {
        printf("%d ", array[i]);
    }
    printf("\n");

    return 0;
}

