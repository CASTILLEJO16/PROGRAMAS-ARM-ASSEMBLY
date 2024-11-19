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

#include <stdio.h>
#include <time.h>

// Declaración de la función en ensamblador
extern void example_function();

int main() {
    struct timespec start, end;

    // Obtener el tiempo antes de ejecutar la función
    clock_gettime(CLOCK_MONOTONIC, &start);

    // Llamar a la función de ejemplo (en ensamblador)
    example_function();

    // Obtener el tiempo después de ejecutar la función
    clock_gettime(CLOCK_MONOTONIC, &end);

    // Calcular el tiempo de ejecución en nanosegundos
    long seconds = end.tv_sec - start.tv_sec;
    long nanoseconds = end.tv_nsec - start.tv_nsec;
    double elapsed = seconds + nanoseconds * 1e-9;

    // Mostrar el tiempo de ejecución
    printf("Tiempo de ejecución: %.9f segundos\n", elapsed);

    return 0;
}
