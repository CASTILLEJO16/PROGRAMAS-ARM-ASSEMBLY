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

namespace HexToDecimalConverter
{
    class Program
    {
        // Función hex_to_decimal
        // Entradas:
        //   hexString: cadena hexadecimal a convertir
        // Salida:
        //   Retorna el número decimal resultante o -1 si la cadena es inválida
        public static int HexToDecimal(string hexString)
        {
            int result = 0; // Inicializar el acumulador (resultado)
            foreach (char c in hexString)
            {
                if (c == '\0') break; // Comprobar si es el final de la cadena

                int digit;
                if (c >= '0' && c <= '9')
                {
                    digit = c - '0'; // Convertir '0'-'9' a 0-9
                }
                else if (c >= 'A' && c <= 'F')
                {
                    digit = c - 'A' + 10; // Convertir 'A'-'F' a 10-15
                }
                else
                {
                    return -1; // Retornar -1 si se encuentra un carácter no válido
                }

                result = (result << 4) + digit; // Multiplicar por 16 (desplazar 4 bits) y sumar el valor convertido
            }
            return result; // Retornar el resultado final
        }

        static void Main(string[] args)
        {
            // Ejemplo de uso:
            string hexString = "1E3F";
            
            // Llamar a la función para convertir la cadena hexadecimal a decimal
            int decimalResult = HexToDecimal(hexString);

            // Mostrar el resultado
            if (decimalResult == -1)
            {
                Console.WriteLine("La cadena contiene caracteres inválidos.");
            }
            else
            {
                Console.WriteLine("Cadena hexadecimal: " + hexString);
                Console.WriteLine("Número decimal: " + decimalResult);
            }
        }
    }
}
*/
#include <stdio.h>
#include <string.h>

// Declaración de la función en ensamblador
extern int hex_to_decimal(const char *hex_string);

int main() {
    char hex_string[9];  // Buffer para almacenar la entrada hexadecimal (hasta 8 dígitos)

    // Solicitar al usuario el número hexadecimal
    printf("Ingrese un número hexadecimal (sin 0x): ");
    scanf("%8s", hex_string);  // Leer hasta 8 caracteres para evitar desbordamiento

    // Llamar a la función en ensamblador para convertir a decimal
    int decimal = hex_to_decimal(hex_string);

    // Mostrar el resultado
    printf("El número en decimal es: %d\n", decimal);

    return 0;
}
