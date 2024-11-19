/*╔════════════════════════════════════════════════════════════════════╗
║                    TECNOLÓGICO NACIONAL DE MÉXICO                 ║
║                     INSTITUTO TECNOLÓGICO DE TIJUANA              ║
╠════════════════════════════════════════════════════════════════════╣
║                   Carrera: Ingeniería en Sistemas                 ║
║                   Nombre: Lennyn Alejandro Castillejo Robles      ║
║                   Matrícula: 22210880                             ║
║                   Materia: INTERFAZ DE USUARIO                    ║
║                                                                  ║
╠════════════════════════════════════════════════════════════════════╣
║                           Septiembre 2024                         ║
╚════════════════════════════════════════════════════════════════════╝
*/

/*
using System;

namespace BasicCalculator
{
    class Program
    {
        // Función calculate
        // Entradas:
        //   a: primer número
        //   b: segundo número
        //   op: operador como carácter ('+', '-', '*', '/')
        // Salida:
        //   Retorna el resultado de la operación o 0 si el operador es inválido
        public static int Calculate(int a, int b, char op)
        {
            switch (op)
            {
                case '+':
                    return a + b; // Suma
                case '-':
                    return a - b; // Resta
                case '*':
                    return a * b; // Multiplicación
                case '/':
                    return b != 0 ? a / b : 0; // División, manejando división por cero
                default:
                    return 0; // Operador inválido
            }
        }

        static void Main(string[] args)
        {
            // Ejemplo de uso:
            int a = 10; // Primer número
            int b = 5;  // Segundo número
            char op = '+'; // Operador

            // Llamar a la función calculate
            int result = Calculate(a, b, op);

            // Mostrar el resultado
            Console.WriteLine("Operación: " + a + " " + op + " " + b);
            Console.WriteLine("Resultado: " + result);
        }
    }
}
*/
.section .text
.global calculate

// Función calculate
// Entradas:
//   w0 = primer número (a)
//   w1 = segundo número (b)
//   w2 = operador (op) como carácter
// Salida:
//   w0 = resultado de la operación
calculate:
    cmp w2, '+'               // Comparar el operador con '+'
    beq do_addition           // Si es '+', hacer la suma

    cmp w2, '-'               // Comparar el operador con '-'
    beq do_subtraction        // Si es '-', hacer la resta

    cmp w2, '*'               // Comparar el operador con '*'
    beq do_multiplication     // Si es '*', hacer la multiplicación

    cmp w2, '/'               // Comparar el operador con '/'
    beq do_division           // Si es '/', hacer la división

    // Si el operador es inválido, devolver 0 como resultado
    mov w0, 0
    ret

do_addition:
    add w0, w0, w1            // Realizar la suma
    ret

do_subtraction:
    sub w0, w0, w1            // Realizar la resta
    ret

do_multiplication:
    mul w0, w0, w1            // Realizar la multiplicación
    ret

do_division:
    // Comprobar si el divisor es 0 para evitar la división por cero
    cbz w1, division_by_zero  // Si b == 0, ir a manejo de división por cero
    sdiv w0, w0, w1           // Realizar la división
    ret

division_by_zero:
    mov w0, 0                 // Retornar 0 si hay división por cero
    ret
