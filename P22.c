/*╔════════════════════════════════════════════════════════════════════╗
║                    TECNOLÓGICO NACIONAL DE MÉXICO                 ║
║                     INSTITUTO TECNOLÓGICO DE TIJUANA              ║
╠════════════════════════════════════════════════════════════════════╣
║                   Carrera: Ingeniería en Sistemas                 ║
║                   Nombre: Lennyn Alejandro Castillejo Robles      ║
║                   Matrícula: 22210880                             ║
║                   Materia: INTERFAZ DE USUARIO                                         ║
  ║
╠════════════════════════════════════════════════════════════════════╣
║                           Septiembre 2024                         ║
╚════════════════════════════════════════════════════════════════════╝
*/
// ASCIINEMA:https://asciinema.org/a/aCgOe8AJxaizhrtO8vHOZsSNq
#include <stdio.h>

// Declaración de la función en ensamblador
extern int ascii_to_int(char c);

int main() {
    char input_char;

    // Solicitar al usuario que ingrese un carácter ASCII (0-9)
    printf("Ingrese un carácter ASCII (0-9): ");
    input_char = getchar();

    // Validar que el carácter ingresado esté en el rango '0'-'9'
    if (input_char < '0' || input_char > '9') {
        printf("Error: Carácter inválido.\n");
        return 1;
    }

    // Llamar a la función en ensamblador para convertir el carácter
    int result = ascii_to_int(input_char);

    // Mostrar el resultado
    printf("El valor entero convertido es: %d\n", result);
    return 0;
}
