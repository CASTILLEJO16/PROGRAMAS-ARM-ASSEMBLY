
/*╔════════════════════════════════════════════════════════════════════╗
║                    TECNOLÓGICO NACIONAL DE MÉXICO                 ║
║                     INSTITUTO TECNOLÓGICO DE TIJUANA              ║
╠════════════════════════════════════════════════════════════════════╣
║                   Carrera: Ingeniería en Sistemas                 ║
║                   Nombre: Lennyn Alejandro Castillejo Robles      ║
║                   Matrícula: 22210880                             ║
║                   Materia: INTERFAZ DE USUARIO                   ║
║                                                                 ║
╠════════════════════════════════════════════════════════════════════╣
║                           Septiembre 2024                         ║
╚════════════════════════════════════════════════════════════════════*/
#include <stdio.h>
#include <math.h>

int binaryToDecimal(long long binary) {
    int decimal = 0;
    int base = 1;

    // Convertir binario a decimal
    while (binary > 0) {
        int lastDigit = binary % 10;
        decimal += lastDigit * base;
        binary /= 10;
        base *= 2;
    }

    return decimal;
}

int main() {
    long long binary;

    // Solicitar al usuario el número binario
    printf("Ingrese un número binario: ");
    scanf("%lld", &binary);

    // Llamar a la función para convertir a decimal
    int decimal = binaryToDecimal(binary);

    // Mostrar el resultado
    printf("El número en decimal es: %d\n", decimal);

    return 0;
}
