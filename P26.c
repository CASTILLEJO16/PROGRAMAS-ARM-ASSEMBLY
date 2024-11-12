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
// ASCIINEMA:https://asciinema.org/a/aCgOe8AJxaizhrtO8vHOZsSNq
*/
#include <stdio.h>

// Declaración de las funciones en ensamblador
extern int bitwise_and(int a, int b);
extern int bitwise_or(int a, int b);
extern int bitwise_xor(int a, int b);

int main() {
    int num1, num2;

    // Solicitar al usuario que ingrese dos números
    printf("Ingrese el primer número: ");
    scanf("%d", &num1);
    printf("Ingrese el segundo número: ");
    scanf("%d", &num2);

    // Realizar las operaciones en ensamblador
    int result_and = bitwise_and(num1, num2);
    int result_or = bitwise_or(num1, num2);
    int result_xor = bitwise_xor(num1, num2);

    // Imprimir los resultados
    printf("Resultado de AND: %d\n", result_and);
    printf("Resultado de OR: %d\n", result_or);
    printf("Resultado de XOR: %d\n", result_xor);

    return 0;
}
