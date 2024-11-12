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
extern void count_vowels_consonants(const char *str, int *vowels, int *consonants);

int main() {
    char input[256];
    int vowels = 0, consonants = 0;

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

    // Llamar a la función en ensamblador para contar vocales y consonantes
    count_vowels_consonants(input, &vowels, &consonants);

    // Mostrar el resultado
    printf("Número de vocales: %d\n", vowels);
    printf("Número de consonantes: %d\n", consonants);

    return 0;
}
