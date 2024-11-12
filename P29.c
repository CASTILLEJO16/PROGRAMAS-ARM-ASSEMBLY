// ASCIINEMA:https://asciinema.org/a/aCgOe8AJxaizhrtO8vHOZsSNq
#include <stdio.h>

// Declaración de la función en ensamblador
extern int count_set_bits(int num);

// Función para convertir un número a su representación binaria en forma de cadena
void to_binary(int num, char *binary_str, int size) {
    int index = size - 1;
    binary_str[size] = '\0'; // Asegurarse de que la cadena esté terminada en NULL

    // Llenar la cadena binaria de derecha a izquierda
    for (int i = index; i >= 0; i--) {
        binary_str[i] = (num & 1) ? '1' : '0';
        num >>= 1;
    }

    // Eliminar ceros iniciales
    int start = 0;
    while (binary_str[start] == '0' && start < index) {
        start++;
    }

    // Desplazar la cadena para eliminar los ceros iniciales
    for (int i = 0; i <= index - start; i++) {
        binary_str[i] = binary_str[i + start];
    }
    binary_str[index - start + 1] = '\0'; // Terminar la cadena correctamente
}

int main() {
    int num;
    char binary_str[33]; // Cadena para almacenar la representación binaria (32 bits + terminador)

    // Solicitar al usuario que ingrese un número
    printf("Ingrese un número: ");
    scanf("%d", &num);

    // Convertir el número a binario y contar los bits activados
    to_binary(num, binary_str, 32); // Convertir el número a una cadena binaria de 32 bits
    int result = count_set_bits(num);

    // Imprimir el número en binario y el número de bits activados
    printf("Representación en binario: %s\n", binary_str);
    printf("Número de bits activados: %d\n", result);

    return 0;
}
