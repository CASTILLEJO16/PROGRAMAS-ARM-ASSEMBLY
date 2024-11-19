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
//ASCIINEMA: https://asciinema.org/a/U32iCkS8QehVv1mnh5RXmyqdS
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

#include <stdio.h>

// Declaración de la función en ensamblador
extern int calculate(int a, int b, char op);

int main() {
    int a, b;
    char op;
    int result;

    // Solicitar al usuario los dos números
    printf("Ingrese el primer número: ");
    scanf("%d", &a);
    printf("Ingrese el segundo número: ");
    scanf("%d", &b);

    // Solicitar al usuario la operación
    printf("Ingrese la operación (+, -, *, /): ");
    scanf(" %c", &op);  // Espacio antes de %c para ignorar saltos de línea

    // Llamar a la función en ensamblador para realizar la operación
    result = calculate(a, b, op);

    // Mostrar el resultado
    printf("El resultado de %d %c %d es: %d\n", a, op, b, result);

    return 0;
}
