/*╔════════════════════════════════════════════════════════════════════╗
║                    TECNOLÓGICO NACIONAL DE MÉXICO                 ║
║                     INSTITUTO TECNOLÓGICO DE TIJUANA              ║
╠════════════════════════════════════════════════════════════════════╣
║                   Carrera: Ingeniería en Sistemas                 ║
║                   Nombre: Lennyn Alejandro Castillejo Robles      ║
║                   Matrícula: 22210880                             ║
║                   Materia: INTERFAZ DE USUARIO                                         ║
║                                                                                                                  ║
╠════════════════════════════════════════════════════════════════════╣
║                           Septiembre 2024                         ║
╚════════════════════════════════════════════════════════════════════╝
*/
#include <stdio.h>

// Declaración de las funciones en ensamblador
extern int shift_left(int num, int positions);
extern int shift_right(int num, int positions);

int main() {
    int num, positions;

    // Solicitar al usuario que ingrese un número y la cantidad de posiciones
    printf("Ingrese un número: ");
    scanf("%d", &num);
    printf("Ingrese la cantidad de posiciones para el desplazamiento: ");
    scanf("%d", &positions);

    // Realizar los desplazamientos en ensamblador
    int result_left = shift_left(num, positions);
    int result_right = shift_right(num, positions);

    // Imprimir los resultados
    printf("Resultado de desplazamiento a la izquierda: %d\n", result_left);
    printf("Resultado de desplazamiento a la derecha: %d\n", result_right);

    return 0;
}
