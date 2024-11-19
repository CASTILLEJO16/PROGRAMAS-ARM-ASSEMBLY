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
.section .text
.global decimal_to_hex

// Función decimal_to_hex
// Entradas:
//   w0 = número decimal a convertir
//   x1 = dirección del buffer de salida
// Salida:
//   El buffer en x1 contendrá la representación en hexadecimal del número en w0
decimal_to_hex:
    mov x2, 8                 // Máximo de 8 dígitos hexadecimales (para un número de 32 bits)
    mov x3, x0                // Copiar el número decimal a x3 para trabajar con él
    add x1, x1, 7             // Mover el puntero al final del buffer para almacenar en orden inverso

    // Si el número es 0, almacenar '0' directamente y terminar
    cbz x3, store_zero

convert_loop:
    and w4, w3, 0xF           // Extraer los últimos 4 bits (un dígito hexadecimal)
    cmp w4, 10                // Verificar si el dígito es mayor o igual a 10
    add w4, w4, '0'           // Convertir a carácter ASCII '0' - '9'
    b.lt store_digit          // Si el dígito es menor a 10, saltar al almacenamiento

    add w4, w4, 7             // Si es >= 10, ajustar para letras 'A' - 'F'

store_digit:
    strb w4, [x1], -1         // Almacenar el dígito en el buffer y mover el puntero hacia atrás
    lsr w3, w3, 4             // Desplazar el número 4 bits a la derecha
    subs x2, x2, 1            // Decrementar el contador de dígitos
    cbnz w3, convert_loop     // Continuar si aún hay bits significativos en x3

    add x1, x1, 1             // Mover el puntero al primer dígito significativo
    b finish_conversion       // Ir a finalizar la conversión

store_zero:
    mov w4, '0'               // Almacenar '0' si el número es cero
    strb w4, [x1], -1         // Guardar '0' en el buffer
    add x1, x1, 1             // Ajustar el puntero al primer dígito

finish_conversion:
    mov w4, 0                 // Carácter nulo para terminar la cadena
    strb w4, [x1]             // Escribir el carácter nulo al final de la cadena
    ret                       // Retornar
