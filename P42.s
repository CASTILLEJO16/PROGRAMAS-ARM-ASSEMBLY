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
.section .text
.global hex_to_decimal

// Función hex_to_decimal
// Entradas:
//   x0 = dirección de la cadena hexadecimal
// Salida:
//   w0 = número decimal resultante
hex_to_decimal:
    mov w1, 0               // Inicializar el acumulador (resultado) en w1
    mov x2, x0              // Copiar el puntero de la cadena en x2 para trabajar

convert_loop:
    ldrb w3, [x2], 1        // Cargar el siguiente byte de la cadena (un carácter)
    cmp w3, 0               // Comprobar si es el final de la cadena (carácter nulo)
    beq end_conversion      // Si es el final, terminar la conversión

    // Convertir el carácter de hexadecimal a valor decimal
    cmp w3, '0'
    b.lt invalid_character  // Si es menor que '0', es inválido
    cmp w3, '9'
    ble valid_digit         // Si está entre '0' y '9', es un dígito válido

    cmp w3, 'A'
    b.lt invalid_character  // Si es menor que 'A', es inválido
    cmp w3, 'F'
    ble valid_letter        // Si está entre 'A' y 'F', es una letra válida

invalid_character:
    mov w0, -1              // Devolver -1 si se encuentra un carácter no válido
    ret

valid_digit:
    sub w3, w3, '0'         // Convertir '0'-'9' a 0-9
    b apply_digit

valid_letter:
    sub w3, w3, 'A'         // Convertir 'A'-'F' a 10-15
    add w3, w3, 10

apply_digit:
    lsl w1, w1, 4           // Multiplicar el acumulador por 16 (desplazamiento a la izquierda de 4 bits)
    add w1, w1, w3          // Sumar el valor convertido al acumulador
    b convert_loop          // Repetir el bucle para el siguiente carácter

end_conversion:
    mov w0, w1              // Mover el resultado al registro de salida
    ret                      // Retornar
