#include <stdio.h>

// Declaración de la función en ensamblador
extern int gcd(int a, int b);

int main() {
    int num1, num2;

    // Solicitar al usuario que ingrese dos números
    printf("Ingrese el primer número: ");
    scanf("%d", &num1);
    printf("Ingrese el segundo número: ");
    scanf("%d", &num2);

    // Llamar a la función en ensamblador para calcular el MCD
    int result = gcd(num1, num2);

    // Imprimir el resultado
    printf("El Máximo Común Divisor es: %d\n", result);

    return 0;
}
