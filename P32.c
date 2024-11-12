/* ╔════════════════════════════════════════════════════════════════════╗ */
/* ║                    TECNOLÓGICO NACIONAL DE MÉXICO
       ║ */
/* ║                     INSTITUTO TECNOLÓGICO DE TIJUANA              ║ */
/* ╠════════════════════════════════════════════════════════════════════╣ */
/* ║                   Carrera: Ingeniería en Sistemas
       ║ */
/* ║                   Nombre: Lennyn Alejandro Castillejo Robles      ║ */
/* ║                   Matrícula: 22210880
       ║ */
/* ║                   Materia: Programación en Ensamblador            ║ */
/* ║
       ║ */
/* ╠════════════════════════════════════════════════════════════════════╣ */
/* ║                           Septiembre 2024
       ║ */
/* ╚════════════════════════════════════════════════════════════════════╝ */

#include <stdio.h>

// Declaración de la función en ensamblador
extern int power(int base, int exponent);

int main() {
    int base, exponent;

    // Solicitar al usuario que ingrese la base y el exponente
    printf("Ingrese la base (x): ");
    scanf("%d", &base);
    printf("Ingrese el exponente (n): ");
    scanf("%d", &exponent);

    // Llamar a la función en ensamblador para calcular la potencia
    int result = power(base, exponent);

    // Imprimir el resultado
    printf("Resultado de %d^%d: %d\n", base, exponent, result);

    return 0;
}
