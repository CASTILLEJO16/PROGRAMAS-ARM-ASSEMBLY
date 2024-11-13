
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
//ASCIINEMA: https://asciinema.org/a/ha5WAgezGJ7A5yUZoJkFrdOyv

#include <stdio.h>

void decimalToBinary(int decimal) {
    int binary[32];  // Arreglo para almacenar los bits (suficiente para un entero de 32 bits)
    int index = 0;

    if (decimal == 0) {
        printf("El número en binario es: 0\n");
        return;
    }

    // Proceso de conversión
    while (decimal > 0) {
        binary[index++] = decimal % 2;  // Almacena el residuo (bit) en el arreglo
        decimal = decimal / 2;          // Divide el número por 2
    }

    // Imprimir el resultado en orden inverso
    printf("El número en binario es: ");
    for (int i = index - 1; i >= 0; i--) {
        printf("%d", binary[i]);
    }
    printf("\n");
}

int main() {
    int decimal;

    // Solicitar al usuario el número decimal
    printf("Ingrese un número decimal: ");
    scanf("%d", &decimal);

    // Llamar a la función para convertir a binario
    decimalToBinary(decimal);

    return 0;
}
