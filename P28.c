// ASCIINEMA:https://asciinema.org/a/aCgOe8AJxaizhrtO8vHOZsSNq
#include <stdio.h>

// Declaración de las funciones en ensamblador
extern int set_bit(int num, int position);
extern int clear_bit(int num, int position);
extern int toggle_bit(int num, int position);

int main() {
    int num, position;

    // Solicitar al usuario que ingrese un número y la posición del bit
    printf("Ingrese un número: ");
    scanf("%d", &num);
    printf("Ingrese la posición del bit (0 = menos significativo): ");
    scanf("%d", &position);

    // Realizar las operaciones en ensamblador
    int result_set = set_bit(num, position);
    int result_clear = clear_bit(num, position);
    int result_toggle = toggle_bit(num, position);

    // Imprimir los resultados
    printf("Resultado después de establecer el bit: %d\n", result_set);
    printf("Resultado después de borrar el bit: %d\n", result_clear);
    printf("Resultado después de alternar el bit: %d\n", result_toggle);

    return 0;
}
