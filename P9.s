// ╔════════════════════════════════════════════════════════════════════╗
// ║                    TECNOLÓGICO NACIONAL DE MÉXICO                 ║
// ║                     INSTITUTO TECNOLÓGICO DE TIJUANA              ║
// ╠════════════════════════════════════════════════════════════════════╣
// ║                   Carrera: Ingeniería en Sistemas                 ║
// ║                   Nombre: Lennyn Alejandro Castillejo Robles      ║
// ║                   Matrícula: 22210880                             ║
// ║                   Materia: Programación en Ensamblador            ║
// ║                                                                   ║
// ╠════════════════════════════════════════════════════════════════════╣
// ║                          noviembre 2024                         ║
// ╚════════════════════════════════════════════════════════════════════╝
//ASCIINEMA:https://asciinema.org/a/KmP25EZV8IphEyhLuc2oj8sGm
/*
// Programa en C# para verificar si un número ingresado es primo
using System;

namespace VerificarPrimo
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Ingrese un número para verificar si es primo: ");
            if (int.TryParse(Console.ReadLine(), out int numero))
            {
                bool esPrimo = EsPrimo(numero);
                if (esPrimo)
                {
                    Console.WriteLine("El número " + numero + " es primo.");
                }
                else
                {
                    Console.WriteLine("El número " + numero + " no es primo.");
                }
            }
            else
            {
                Console.WriteLine("Entrada no válida. Ingrese un número entero.");
            }
        }

        // Función para verificar si un número es primo
        static bool EsPrimo(int numero)
        {
            if (numero <= 1) return false;  // Los números menores o iguales a 1 no son primos
            if (numero == 2) return true;   // 2 es primo

            for (int i = 2; i <= Math.Sqrt(numero); i++)
            {
                if (numero % i == 0)
                {
                    return false; // Si es divisible por i, no es primo
                }
            }
            return true; // Es primo si no es divisible por ningún número hasta la raíz cuadrada de él
        }
    }
  */
  // Programa en ARM64 Assembly para verificar si un número ingresado es primo en RaspbianOS

.data
    prompt:       .asciz "Ingrese un numero para verificar si es primo: " // Mensaje para solicitar el número
    primeMsg:     .asciz "El numero es primo\n"                           // Mensaje si el número es primo
    notPrimeMsg:  .asciz "El numero no es primo\n"                        // Mensaje si el número no es primo
    newline:      .asciz "\n"                                             // Nueva línea
    buffer:       .space 100                                              // Espacio para leer la entrada del usuario

.text
    .global _start

_start:
    // Mostrar el mensaje para solicitar el número
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =prompt                 // Dirección del mensaje "Ingrese un numero para verificar si es primo: "
    mov x2, #46                     // Longitud del mensaje
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    // Leer el número ingresado por el usuario
    mov x0, #0                      // Descriptor de archivo para STDIN
    ldr x1, =buffer                 // Dirección del buffer para almacenar la entrada del usuario
    mov x2, #100                    // Longitud máxima a leer
    mov x8, #63                     // Syscall para 'read' (63)
    svc #0                          // Ejecutar syscall

    // Convertir la entrada (en ASCII) a un número entero
    ldr w1, =buffer                 // Dirección del buffer
    bl atoi                         // Llamar a la función atoi para conversión
    mov w4, w0                      // Almacenar el número en w4

    // Verificar si el número es menor o igual a 1
    cmp w4, #1
    ble not_prime                   // Si el número es <= 1, no es primo

    // Iniciar el ciclo de verificación para ver si tiene divisores
    mov w5, #2                      // Inicializar el divisor en 2

check_prime:
    mul w6, w5, w5                  // Calcular w5 * w5 (para verificar hasta sqrt(n))
    cmp w6, w4                      // Comparar w5*w5 con el número
    bgt is_prime                    // Si w5*w5 > número, es primo

    udiv w7, w4, w5                 // Calcular número / divisor
    msub w8, w7, w5, w4             // Obtener el residuo: w8 = número - (divisor * (número / divisor))
    cbz w8, not_prime               // Si el residuo es cero, no es primo

    add w5, w5, #1                  // Incrementar el divisor
    b check_prime                   // Repetir el ciclo

is_prime:
    // Mostrar mensaje "El numero es primo"
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =primeMsg               // Dirección del mensaje "El numero es primo\n"
    mov x2, #19                     // Longitud del mensaje
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall
    b end_program                   // Terminar el programa

not_prime:
    // Mostrar mensaje "El numero no es primo"
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =notPrimeMsg            // Dirección del mensaje "El numero no es primo\n"
    mov x2, #22                     // Longitud del mensaje
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

end_program:
    // Terminar el programa
    mov x8, #93                     // Syscall para 'exit' (93)
    svc #0                          // Ejecutar syscall

// Función atoi: convierte una cadena ASCII a un entero
// Entrada: w1 = dirección de la cadena
// Salida: w0 = número entero
atoi:
    mov w0, #0                      // Inicializar el resultado a 0
    mov w9, #10                     // Valor 10 en w9 para las multiplicaciones
atoi_loop:
    ldrb w2, [x1], #1               // Cargar el siguiente carácter de la cadena
    sub w2, w2, '0'                 // Convertir carácter ASCII a valor numérico
    cmp w2, #9                      // Si es mayor que 9, fin de cadena
    bhi atoi_done
    mul w0, w0, w9                  // Multiplicar el resultado por 10 usando el registro w9
    add w0, w0, w2                  // Agregar el dígito al resultado
    b atoi_loop                     // Repetir para el siguiente carácter
atoi_done:
    ret                             // Retornar con el resultado en w0
