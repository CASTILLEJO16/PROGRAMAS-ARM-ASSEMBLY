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

/* Función en C# para realizar desplazamiento lógico a la izquierda y a la derecha */
/* Entradas: */
/*   number: número entero que se desea desplazar */
/*   positions: cantidad de posiciones a desplazar */
/* Salidas: */
/*   Devuelve el resultado del desplazamiento */

// public static int ShiftLeft(int number, int positions)
// {
//     /* Realiza el desplazamiento lógico a la izquierda */
//     return number << positions; // Desplazamiento a la izquierda
// }

// public static int ShiftRight(int number, int positions)
// {
//     /* Realiza el desplazamiento lógico a la derecha */
//     return number >> positions; // Desplazamiento a la derecha
// }
.section .text
.global gcd

// Función gcd
// Entradas: x0 = primer número (a), x1 = segundo número (b)
// Salida: w0 = MCD de a y b
gcd:
    cmp w1, 0                // Comparar b con 0
    beq end_gcd              // Si b es 0, terminar (MCD encontrado en a)

loop:
    udiv w2, w0, w1          // Calcular a / b y guardar en w2
    msub w3, w2, w1, w0      // Calcular a % b usando a - (a / b) * b
    mov w0, w1               // Mover el valor de b a a
    mov w1, w3               // Mover el residuo (a % b) a b
    cmp w1, 0                // Comparar b con 0 nuevamente
    bne loop                 // Repetir el bucle hasta que b sea 0

end_gcd:
    mov w0, w0               // Al terminar, el MCD está en a (en w0)
    ret                      // Retornar el resultado
