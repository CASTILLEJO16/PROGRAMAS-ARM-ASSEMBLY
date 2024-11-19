/*╔════════════════════════════════════════════════════════════════════╗
║                    TECNOLÓGICO NACIONAL DE MÉXICO                 ║
║                     INSTITUTO TECNOLÓGICO DE TIJUANA              ║
╠════════════════════════════════════════════════════════════════════╣
║                   Carrera: Ingeniería en Sistemas                 ║
║                   Nombre: Lennyn Alejandro Castillejo Robles      ║
║                   Matrícula: 22210880                             ║
║                   Materia: INTERFAZ DE USUARIO                    ║
║                                                                  ║
╠════════════════════════════════════════════════════════════════════╣
║                           Septiembre 2024                         ║
╚════════════════════════════════════════════════════════════════════╝
*/
//ASCIINEMA: https://asciinema.org/a/U32iCkS8QehVv1mnh5RXmyqdS
/*
#include <stdio.h>
#include <string.h>

// Función longest_common_prefix
// Entradas:
//   strings: arreglo de punteros a cadenas
//   num_strings: número de cadenas
//   buffer: puntero al buffer donde se almacenará el prefijo común
// Salida:
//   Retorna la longitud del prefijo común encontrado
int longest_common_prefix(char **strings, int num_strings, char *buffer) {
    if (num_strings == 0) {
        buffer[0] = '\0'; // Si no hay cadenas, retornar prefijo vacío
        return 0;
    }

    int prefix_length = 0; // Longitud del prefijo inicializada a 0

    while (1) {
        char current_char = strings[0][prefix_length]; // Obtener el carácter actual de la primera cadena

        if (current_char == '\0') break; // Si el carácter es nulo, terminar el prefijo

        for (int i = 1; i < num_strings; i++) { // Comparar con el resto de las cadenas
            if (strings[i][prefix_length] != current_char || strings[i][prefix_length] == '\0') {
                buffer[prefix_length] = '\0'; // Agregar carácter nulo al final del prefijo
                return prefix_length; // Retornar la longitud del prefijo
            }
        }

        buffer[prefix_length] = current_char; // Guardar el carácter en el buffer
        prefix_length++; // Incrementar la longitud del prefijo
    }

    buffer[prefix_length] = '\0'; // Agregar carácter nulo al final del prefijo
    return prefix_length; // Retornar la longitud del prefijo
}

int main() {
    // Ejemplo de uso:
    char *strings[] = {"interfaz", "interno", "interesante"};
    int num_strings = 3;
    char buffer[100]; // Buffer para almacenar el prefijo común

    // Llamar a la función para obtener el prefijo común
    int prefix_length = longest_common_prefix(strings, num_strings, buffer);

    // Mostrar el resultado
    printf("Prefijo común: %s\n", buffer);
    printf("Longitud del prefijo común: %d\n", prefix_length);

    return 0;
}
*/


#include <stdio.h>
#include <string.h>

#define MAX_STRINGS 10
#define MAX_LENGTH 100

// Declaración de la función en ensamblador
extern int longest_common_prefix(char *strings[], int count, char *prefix);

int main() {
    int n;
    char strings[MAX_STRINGS][MAX_LENGTH];
    char *string_ptrs[MAX_STRINGS];  // Punteros a las cadenas

    // Solicitar el número de cadenas
    printf("Ingrese el número de cadenas (máximo %d): ", MAX_STRINGS);
    scanf("%d", &n);

    if (n < 2) {
        printf("Debe ingresar al menos dos cadenas para comparar.\n");
        return 1;
    }

    // Limpiar el buffer de entrada
    getchar();

    // Leer las cadenas
    for (int i = 0; i < n; i++) {
        printf("Ingrese la cadena %d: ", i + 1);
        fgets(strings[i], MAX_LENGTH, stdin);

        // Eliminar el salto de línea al final de la cadena
        strings[i][strcspn(strings[i], "\n")] = '\0';
        string_ptrs[i] = strings[i];  // Almacenar el puntero a cada cadena
    }

    char prefix[MAX_LENGTH];  // Para almacenar el prefijo común

    // Llamar a la función en ensamblador para encontrar el prefijo común
    int prefix_length = longest_common_prefix(string_ptrs, n, prefix);

    // Mostrar el resultado
    if (prefix_length > 0) {
        printf("El prefijo común más largo es: %s\n", prefix);
    } else {
        printf("No hay un prefijo común.\n");
    }

    return 0;
}
