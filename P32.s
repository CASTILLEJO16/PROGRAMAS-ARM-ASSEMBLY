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

/* Función en C# para calcular la potencia de un número (x^n) usando exponenciación rápida */
/* Entradas: */
/*   baseNum: la base x */
/*   exponent: el exponente n */
/* Salidas: */
/*   Devuelve el resultado de x^n */

// public static int Power(int baseNum, int exponent)
// {
//     /* Inicializar el resultado en 1 */
//     int result = 1;

//     /* Verificar si el exponente es 0, ya que cualquier número elevado a 0 es 1 */
//     if (exponent == 0)
//         return 1;

//     /* Bucle para calcular la potencia utilizando exponenciación rápida */
//     while (exponent > 0)
//     {
//         /* Verificar si el exponente es impar (exponent & 1) */
//         if ((exponent & 1) == 1)
//         {
//             /* Multiplicar el resultado por la base si el exponente es impar */
//             result *= baseNum;
//         }

//         /* Elevar la base al cuadrado (baseNum *= baseNum) */
//         baseNum *= baseNum;

//         /* Dividir el exponente por 2 (exponent >>= 1) */
//         exponent >>= 1;
//     }

//     /* Retornar el resultado acumulado */
//     return result;
// }
.section .text
.global power

// Función power
// Entradas: x0 = base (x), x1 = exponente (n)
// Salida: w0 = resultado de x^n
power:
    mov w2, 1                 // Inicializar el resultado en 1 (w2 es el acumulador)

    cmp w1, 0                 // Comparar el exponente con 0
    beq end_power             // Si el exponente es 0, retornar 1 (cualquier número elevado a 0 es 1)

power_loop:
    and w3, w1, 1             // Verificar si el exponente es impar (w1 & 1)
    cbz w3, skip_multiply     // Si el bit menos significativo es 0, el exponente es par, saltar la multiplicación
    mul w2, w2, w0            // Multiplicar el acumulador por la base

skip_multiply:
    mul w0, w0, w0            // Elevar la base al cuadrado (base *= base)
    lsr w1, w1, 1             // Dividir el exponente por 2 (exponente >>= 1)
    cmp w1, 0                 // Verificar si el exponente es 0
    bne power_loop            // Repetir el bucle si el exponente aún no es 0

end_power:
    mov w0, w2                // Mover el resultado acumulado a w0 para el retorno
    ret                       // Retornar el resultado
