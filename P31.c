/* ╔════════════════════════════════════════════════════════════════════╗ */
/* ║                    TECNOLÓGICO NACIONAL DE MÉXICO                 ║ */
/* ║                     INSTITUTO TECNOLÓGICO DE TIJUANA              ║ */
/* ╠════════════════════════════════════════════════════════════════════╣ */
/* ║                   Carrera: Ingeniería en Sistemas                 ║ */
/* ║                   Nombre: Lennyn Alejandro Castillejo Robles      ║ */
/* ║                   Matrícula: 22210880                             ║ */
/* ║                   Materia: Programación en Ensamblador            ║ */
/* ║                                                                   ║ */
/* ╠════════════════════════════════════════════════════════════════════╣ */
/* ║                           Septiembre 2024                         ║ */
/* ╚════════════════════════════════════════════════════════════════════╝ */
//ASCIINEMA: https://asciinema.org/a/ha5WAgezGJ7A5yUZoJkFrdOyv



#include <stdio.h>
#include <stdlib.h>

// Declaración de la función en ensamblador para calcular el MCD
extern int gcd(int a, int b);

int main() {
    int num1, num2;

    // Solicitar al usuario que ingrese dos números
    printf("Ingrese el primer número: ");
    scanf("%d", &num1);
    printf("Ingrese el segundo número: ");
    scanf("%d", &num2);

    // Llamar a la función en ensamblador para calcular el MCD
    int mcd = gcd(num1, num2);

    // Calcular el MCM usando la fórmula MCM(a, b) = |a * b| / MCD(a, b)
    long long product = (long long)num1 * (long long)num2; // Calcular a * b como long long para evitar desbordamiento
    int mcm = abs(product) / mcd; // Dividir el valor absoluto del producto por el MCD

    // Imprimir solo el resultado del MCM
    printf("El Mínimo Común Múltiplo es: %d\n", mcm);

    return 0;
}
