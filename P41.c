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

namespace DecimalToHexConverter
{
    class Program
    {
        // Función decimal_to_hex
        // Entradas:
        //   decimalNumber: número decimal a convertir
        //   buffer: dirección del buffer de salida
        // Salida:
        //   El buffer contendrá la representación en hexadecimal del número
        public static void DecimalToHex(int decimalNumber, char[] buffer)
        {
            int maxDigits = 8; // Máximo de 8 dígitos hexadecimales para un entero de 32 bits
            int index = buffer.Length - 1; // Posición para almacenar el carácter nulo al final
            int number = decimalNumber; // Copiar el número decimal para trabajar con él

            // Si el número es 0, almacenar '0' directamente y terminar
            if (number == 0)
            {
                buffer[--index] = '0';
                buffer[buffer.Length - 1] = '\0'; // Agregar el carácter nulo
                return;
            }

            // Convertir número a hexadecimal
            while (number != 0 && maxDigits-- > 0)
            {
                int digit = number & 0xF; // Extraer los últimos 4 bits (un dígito hexadecimal)
                if (digit < 10)
                {
                    buffer[--index] = (char)(digit + '0'); // Convertir a carácter ASCII '0'-'9'
                }
                else
                {
                    buffer[--index] = (char)(digit - 10 + 'A'); // Convertir a carácter ASCII 'A'-'F'
                }
                number >>= 4; // Desplazar el número 4 bits a la derecha
            }

            // Agregar carácter nulo al final de la cadena
            buffer[buffer.Length - 1] = '\0';
        }

        static void Main(string[] args)
        {
            // Ejemplo de uso:
            char[] buffer = new char[9]; // Buffer para 8 dígitos hexadecimales + carácter nulo
            int decimalNumber = 123456;

            // Llamar a la función para convertir el número decimal a hexadecimal
            DecimalToHex(decimalNumber, buffer);

            // Mostrar el resultado
            Console.WriteLine("Número decimal: " + decimalNumber);
            Console.WriteLine("Número en hexadecimal: " + new string(buffer).TrimEnd('\0'));
        }
    }
}
*/
#include <stdio.h>

// Declaración de la función en ensamblador
extern void decimal_to_hex(int decimal, char *hex_buffer);

int main() {
    int decimal;
    char hex_buffer[9];  // Buffer para almacenar el número hexadecimal (8 dígitos + nulo)

    // Inicializar el buffer con ceros
    for (int i = 0; i < 9; i++) {
        hex_buffer[i] = '\0';
    }

    // Solicitar al usuario el número decimal
    printf("Ingrese un número decimal: ");
    scanf("%d", &decimal);

    // Llamar a la función en ensamblador para convertir a hexadecimal
    decimal_to_hex(decimal, hex_buffer);

    // Mostrar el resultado
    printf("El número en hexadecimal es: FF %s\n", hex_buffer);

    return 0;
}
