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

// Declaración de la función en ensamblador
extern int string_length(const char *str);

int main() {
    char input[256];

    // Solicitar al usuario que ingrese una cadena
    printf("Ingrese una cadena: ");
    if (fgets(input, sizeof(input), stdin) == NULL) {
        printf("Error al leer la entrada.\n");
        return 1;
    }

    // Reemplazar el salto de línea con '\0' si existe
    for (int i = 0; i < 256; i++) {
        if (input[i] == '\n') {
            input[i] = '\0';
            break;
        }
    }

    // Llamar a la función en ensamblador para calcular la longitud
    int length = string_length(input);

    // Mostrar la longitud de la cadena
    printf("La longitud de la cadena es: %d\n", length);
    return 0;
}
