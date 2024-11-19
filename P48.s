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

// Función example_function
// Esta función simplemente realiza una tarea en un bucle para simular trabajo
void example_function() {
    int counter = 1000000; // Inicializar el contador en 1,000,000

    while (counter > 0) { // Bucle que se ejecuta mientras el contador sea mayor que 0
        counter--; // Decrementar el contador en cada iteración
    }

    // Al finalizar, no se realiza ninguna tarea específica (simula trabajo)
}

int main() {
    // Llamar a la función example_function
    example_function();

    // Mostrar un mensaje para indicar que se completó el trabajo
    printf("El trabajo simulado ha sido completado.\n");

    return 0; // Terminar el programa
}
*/

.section .text
.global example_function

// Función example_function
// Esta función simplemente realiza una tarea en un bucle para simular trabajo
example_function:
    movz w0, #0xF424           // Cargar la parte baja de 1,000,000 en w0 (0xF424 en hexadecimal es 100,000)
    movk w0, #0x0, lsl #16     // Completar el valor de 1,000,000 en w0

loop:
    subs w0, w0, 1             // Restar 1 de w0 (decrementar el contador)
    bne loop                   // Si w0 no es cero, repetir el bucle

    ret                        // Retornar al finalizar
