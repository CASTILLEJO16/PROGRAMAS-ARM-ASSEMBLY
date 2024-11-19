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
#include <limits.h>

// Función add_with_overflow_detection
// Entradas:
//   a: primer número
//   b: segundo número
//   result: puntero al resultado (int *result)
// Salida:
//   Retorna 1 si hay desbordamiento, 0 si no hay desbordamiento
int add_with_overflow_detection(int a, int b, int *result) {
    long long temp = (long long)a + (long long)b; // Sumar como long long para detectar desbordamiento

    if (temp > INT_MAX || temp < INT_MIN) { // Verificar si el resultado excede el rango de int
        return 1; // Retornar 1 si hay desbordamiento
    }

    *result = (int)temp; // Almacenar el resultado si no hay desbordamiento
    return 0; // Retornar 0 indicando que no hubo desbordamiento
}

int main() {
    // Ejemplo de uso:
    int a = 2147483647; // Valor máximo de un int
    int b = 1;          // Incremento que causa desbordamiento
    int result;

    // Llamar a la función para sumar con detección de desbordamiento
    int overflow = add_with_overflow_detection(a, b, &result);

    if (overflow) {
        printf("Desbordamiento detectado. La suma no es válida.\n");
    } else {
        printf("Suma exitosa: %d\n", result);
    }

    return 0;
}
*/
#include <stdio.h>

// Declaración de la función en ensamblador
extern int add_with_overflow_detection(int a, int b, int *result);

int main() {
    int a, b, result;

    // Solicitar los dos números al usuario
    printf("Ingrese el primer número: ");
    scanf("%d", &a);
    printf("Ingrese el segundo número: ");
    scanf("%d", &b);

    // Llamar a la función en ensamblador para sumar y detectar desbordamiento
    int overflow = add_with_overflow_detection(a, b, &result);

    // Mostrar el resultado
    if (overflow) {
        printf("Desbordamiento detectado en la suma de %d y %d.\n", a, b);
    } else {
        printf("El resultado de la suma es: %d\n", result);
    }

    return 0;
}
