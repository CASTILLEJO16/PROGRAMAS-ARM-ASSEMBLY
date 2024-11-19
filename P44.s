
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

namespace RandomNumberGenerator
{
    class Program
    {
        // Función random_number
        // Entrada:
        //   ref seed: referencia a la semilla (int *seed en ensamblador)
        // Salida:
        //   Retorna el número aleatorio generado
        public static int RandomNumber(ref int seed)
        {
            // Parámetros del método de congruencia lineal
            const int a = 1664525;        // Multiplicador
            const int c = 1013904223;    // Incremento
            const int m = 0x7FFFFFFF;    // Módulo (2^31 - 1)

            // Calcular el nuevo valor de la semilla
            seed = (seed * a + c) & m;   // (seed * a + c) % m, usando máscara para limitar el rango

            // Retornar el número aleatorio generado
            return seed;
        }

        static void Main(string[] args)
        {
            // Ejemplo de uso:
            int seed = 12345; // Valor inicial de la semilla

            // Generar un número aleatorio
            int random = RandomNumber(ref seed);

            // Mostrar el resultado
            Console.WriteLine("Semilla inicial: 12345");
            Console.WriteLine("Número aleatorio generado: " + random);

            // Generar otro número aleatorio para demostrar la continuidad
            random = RandomNumber(ref seed);
            Console.WriteLine("Siguiente número aleatorio generado: " + random);
        }
    }
}
*/


.section .text
.global random_number

// Función random_number
// Entrada:
//   x0 = puntero a la semilla (int *seed)
// Salida:
//   w0 = número aleatorio generado
random_number:
    ldr w1, [x0]               // Cargar el valor de la semilla en w1

    // Parámetros del método de congruencia lineal
    movz w2, 0x1955, lsl #16   // Multiplicador a (1664525)
    movk w2, 0x25ED, lsl #0    // Completar el valor de 1664525 en w2

    movz w3, 0x3C6E, lsl #16   // Incremento c (1013904223)
    movk w3, 0x0F3F, lsl #0    // Completar el valor de 1013904223 en w3

    mov w4, 0x7FFFFFFF         // Módulo m (2^31 - 1 para limitar el rango a 31 bits)

    // Calcular el nuevo valor: (seed * a + c) % m
    mul w1, w1, w2             // seed * a
    add w1, w1, w3             // seed * a + c
    and w1, w1, w4             // Aplicar el módulo m usando una máscara

    // Guardar el nuevo valor de la semilla
    str w1, [x0]               // Almacenar el nuevo valor de la semilla en la dirección original

    // Devolver el número aleatorio
    mov w0, w1                 // Mover el valor calculado a w0 para la salida
    ret                        // Retornar
