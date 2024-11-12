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
// ASCIINEMA:https://asciinema.org/a/aCgOe8AJxaizhrtO8vHOZsSNq
#include <stdio.h>

// Declaración de la función en ensamblador
extern char int_to_ascii(int num);

int main() {
    int input_num;
    char buffer[10];

    // Solicitar al usuario que ingrese un número entre 0 y 9
    printf("Ingrese un número entero (0-9): ");
    fgets(buffer, sizeof(buffer), stdin); // Leer entrada como cadena

    // Intentar convertir la cadena a un número entero
    if (sscanf(buffer, "%d", &input_num) != 1) {
        printf("Error: Entrada no válida.\n");
        return 1;
    }

    // Validar que el número ingresado esté en el rango 0-9
    if (input_num < 0 || input_num > 9) {
        printf("Error: Número fuera de rango.\n");
        return 1;
    }

    // Llamar a la función en ensamblador para convertir el número
    char result = int_to_ascii(input_num);

    // Mostrar el resultado
    printf("El carácter ASCII correspondiente es: %c\n", result);
    return 0;
}
