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

#include <stdio.h>

// Declaración de la función en ensamblador
extern int random_number(int *seed);

// Función para inicializar y generar múltiples números aleatorios
void generate_random_numbers(int seed, int count) {
    for (int i = 0; i < count; i++) {
        int num = random_number(&seed);  // Llamada a la función ensambladora
        printf("Número aleatorio %d: %d\n", i + 1, num);
    }
}

int main() {
    int seed, count;

    // Solicitar la semilla
    printf("Ingrese la semilla para el generador de números aleatorios: ");
    scanf("%d", &seed);

    // Solicitar la cantidad de números aleatorios
    printf("Ingrese la cantidad de números aleatorios a generar: ");
    scanf("%d", &count);

    // Generar y mostrar los números aleatorios
    generate_random_numbers(seed, count);

    return 0;
}
