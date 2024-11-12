/*╔════════════════════════════════════════════════════════════════════╗
║                    TECNOLÓGICO NACIONAL DE MÉXICO                 ║
║                     INSTITUTO TECNOLÓGICO DE TIJUANA              ║
╠════════════════════════════════════════════════════════════════════╣
║                   Carrera: Ingeniería en Sistemas                 ║
║                   Nombre: Lennyn Alejandro Castillejo Robles      ║
║                   Matrícula: 22210880                             ║
║                   Materia: INTERFAZ DE USUARIO                                         ║
║                                                                                                                  ║
╠════════════════════════════════════════════════════════════════════╣
║                           Septiembre 2024                         ║
╚════════════════════════════════════════════════════════════════════╝
*/
#include <stdio.h>

// Declaración de las funciones en ensamblador
extern int shift_left(int num, int positions);
extern int shift_right(int num, int positions);

int main() {
    int num, positions;

    // Solicitar al usuario que ingrese un número y la cantidad de posiciones
    printf("Ingrese un número: ");
    scanf("%d", &num);
    printf("Ingrese la cantidad de posiciones para el desplazamiento: ");
    scanf("%d", &positions);

    // Realizar los desplazamientos en ensamblador
    int result_left = shift_left(num, positions);
    int result_right = shift_right(num, positions);

    // Imprimir los resultados
    printf("Resultado de desplazamiento a la izquierda: %d\n", result_left);
    printf("Resultado de desplazamiento a la derecha: %d\n", result_right);

    return 0;
}
ubuntu@ip-172-31-23-119:~$ cat P28.s
.section .text
.global set_bit
.global clear_bit
.global toggle_bit

// Función set_bit
// Entradas: x0 = número, x1 = posición del bit
// Salida: w0 = resultado con el bit establecido en 1
set_bit:
    mov w2, 1                // Colocar 1 en w2
    lsl w2, w2, w1           // Desplazar 1 a la izquierda por "posición" veces (1 << posición)
    orr w0, w0, w2           // Establecer el bit usando OR
    ret                      // Retornar el resultado

// Función clear_bit
// Entradas: x0 = número, x1 = posición del bit
// Salida: w0 = resultado con el bit borrado (establecido en 0)
clear_bit:
    mov w2, 1                // Colocar 1 en w2
    lsl w2, w2, w1           // Desplazar 1 a la izquierda por "posición" veces
    mvn w2, w2               // Invertir todos los bits para obtener una máscara con un 0 en la posición deseada
    and w0, w0, w2           // Borrar el bit usando AND
    ret                      // Retornar el resultado

// Función toggle_bit
// Entradas: x0 = número, x1 = posición del bit
// Salida: w0 = resultado con el bit alternado (cambiado entre 0 y 1)
toggle_bit:
    mov w2, 1                // Colocar 1 en w2
    lsl w2, w2, w1           // Desplazar 1 a la izquierda por "posición" veces
    eor w0, w0, w2           // Alternar el bit usando XOR
    ret                      // Retornar el resultado
