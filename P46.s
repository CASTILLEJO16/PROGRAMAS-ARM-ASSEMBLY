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


.section .text
.global longest_common_prefix

// Función longest_common_prefix
// Entradas:
//   x0 = puntero al arreglo de punteros a cadenas
//   x1 = número de cadenas
//   x2 = puntero al buffer para almacenar el prefijo común
// Salida:
//   w0 = longitud del prefijo común encontrado
longest_common_prefix:
    cbz x1, end               // Si el número de cadenas es 0, retornar 0
    mov w3, 0                 // Inicializar el índice de prefijo (w3)

loop_chars:
    // Cargar el primer carácter de la primera cadena
    ldr x4, [x0]              // Cargar el puntero de la primera cadena en x4
    add x4, x4, w3, sxtw      // Avanzar al carácter actual de la primera cadena (sign extend)
    ldrb w5, [x4]             // Cargar el carácter en w5
    cbz w5, end_prefix        // Si es el fin de la cadena, ir al final del prefijo

    // Comenzar la comparación con las demás cadenas
    mov x6, x0                // Restablecer el puntero al arreglo de cadenas
    mov w7, 1                 // Índice de cadena (comenzar desde la segunda cadena)

compare_loop:
    cmp w7, w1                // Comparar índice de cadena con el número total
    b.ge store_char           // Si se han comparado todas las cadenas, guardar el carácter

    // Cargar el carácter correspondiente de la cadena actual
    ldr x8, [x6, x7, lsl #3]  // Cargar el puntero de la cadena x7 (usar lsl para multiplicar por 8)
    add x8, x8, w3, sxtw      // Mover el puntero al carácter actual de la cadena (sign extend)
    ldrb w9, [x8]             // Cargar el carácter en w9
    cmp w5, w9                // Comparar el carácter con el de la primera cadena
    b.ne end_prefix           // Si es diferente, terminar el prefijo
    add w7, w7, 1             // Incrementar el índice de cadena
    b compare_loop            // Repetir para la siguiente cadena

store_char:
    // Guardar el carácter en el buffer de prefijo
    strb w5, [x2, w3, sxtw]   // Almacenar el carácter actual en el buffer de prefijo (sign extend)
    add w3, w3, 1             // Incrementar la longitud del prefijo
    b loop_chars              // Repetir para el siguiente carácter

end_prefix:
    strb wzr, [x2, w3, sxtw]  // Agregar un carácter nulo al final del prefijo (sign extend)
    mov w0, w3                // Devolver la longitud del prefijo
    ret

end:
    mov w0, 0                 // Si no hay cadenas, retornar 0
    ret
