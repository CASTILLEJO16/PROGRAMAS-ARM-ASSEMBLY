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
// ║                           noviembre 2024                         ║
// ╚════════════════════════════════════════════════════════════════════╝
//ASCIINEMA:https://asciinema.org/a/KmP25EZV8IphEyhLuc2oj8sGm
// Código en C# para calcular y mostrar la serie de Fibonacci hasta N términos ingresados por el usuario.
/*
using System;

namespace SerieFibonacci
{
    class Program
    {
        static void Main(string[] args)
        {
            // Solicitar el número de términos para calcular la serie de Fibonacci
            Console.Write("Ingrese el numero de terminos de la serie de Fibonacci: ");
            string input = Console.ReadLine();
            int N = Atoi(input);  // Convertir la entrada a un número entero

            Console.Write("Serie de Fibonacci: ");
            int a = 0, b = 1, temp;

            for (int i = 0; i < N; i++)
            {
                Console.Write(Itoa(a) + " ");
                temp = a;
                a = b;
                b = temp + b;
            }
            Console.WriteLine();
        }

        // Función que convierte una cadena ASCII a un entero (simulación de atoi)
        static int Atoi(string str)
        {
            int resultado = 0;
            foreach (char c in str)
            {
                if (char.IsDigit(c))
                {
                    resultado = resultado * 10 + (c - '0');
                }
                else
                {
                    throw new FormatException("Entrada no válida. Ingrese solo números.");
                }
            }
            return resultado;
        }

        // Función que convierte un entero a una cadena ASCII (simulación de itoa)
        static string Itoa(int numero)
        {
            return numero.ToString(); // En C# usamos el método ToString()
        }
    }
}
*/
// Programa en ARM64 Assembly para calcular y mostrar la serie de Fibonacci hasta N términos en RaspbianOS.

.data
    prompt:       .asciz "Ingrese el numero de terminos de la serie de Fibonacci: " // Mensaje para solicitar el número de términos
    resultMsg:    .asciz "Serie de Fibonacci: "                                    // Mensaje para mostrar la serie
    newline:      .asciz "\n"                                                      // Nueva línea
    buffer:       .space 100                                                       // Espacio para leer la entrada del usuario
    resultBuffer: .space 500                                                       // Espacio para almacenar la serie de Fibonacci

.text
    .global _start

_start:
    // Mostrar el mensaje para solicitar el número de términos
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =prompt                 // Dirección del mensaje "Ingrese el numero de terminos de la serie de Fibonacci: "
    mov x2, #50                     // Longitud del mensaje
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    // Leer el número de términos
    mov x0, #0                      // Descriptor de archivo para STDIN
    ldr x1, =buffer                 // Dirección del buffer para almacenar la entrada del usuario
    mov x2, #100                    // Longitud máxima a leer
    mov x8, #63                     // Syscall para 'read' (63)
    svc #0                          // Ejecutar syscall

    // Convertir la entrada (en ASCII) a un número entero
    ldr w1, =buffer                 // Dirección del buffer
    bl atoi                         // Llamar a la función atoi para conversión
    mov w4, w0                      // Almacenar el número de términos en w4

    // Mostrar mensaje "Serie de Fibonacci: "
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =resultMsg              // Dirección del mensaje "Serie de Fibonacci: "
    mov x2, #18                     // Longitud del mensaje
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    // Inicializar valores para calcular la serie de Fibonacci
    mov w5, #0                      // Primer número de Fibonacci (0)
    mov w6, #1                      // Segundo número de Fibonacci (1)
    mov w7, w4                      // Contador de términos
    ldr x1, =resultBuffer           // Dirección del buffer para almacenar la serie
    mov x10, x1                     // Guardar la posición inicial del buffer en x10

fibonacci_loop:
    cbz w7, fibonacci_done          // Si el contador llega a 0, terminar el bucle

    // Convertir el número actual de Fibonacci (w5) a ASCII y almacenarlo en el buffer
    mov w0, w5                      // Mover el número actual a w0
    bl itoa                         // Llamar a la función para convertir el número a ASCII

    // Agregar el número convertido al buffer de resultados
    mov x2, x0                      // x0 tiene la dirección del número convertido
store_to_buffer:
    ldrb w8, [x2], #1               // Leer un byte del número convertido
    strb w8, [x1], #1               // Almacenar el byte en resultBuffer
    cbnz w8, store_to_buffer        // Repetir hasta que se alcance el fin de la cadena

    // Agregar un espacio entre los números de la serie
    mov w8, #' '                    // Espacio en ASCII
    strb w8, [x1], #1               // Almacenar el espacio en el buffer

    // Calcular el siguiente número de Fibonacci
    add w8, w5, w6                  // w8 = w5 + w6
    mov w5, w6                      // Mover w6 a w5
    mov w6, w8                      // Mover w8 a w6

    // Decrementar el contador y repetir el bucle
    sub w7, w7, #1
    b fibonacci_loop

fibonacci_done:
    // Agregar una nueva línea al final de la serie
    mov w8, #10                     // Nueva línea en ASCII
    strb w8, [x1], #1               // Almacenar la nueva línea en el buffer

    // Calcular la longitud de la cadena en resultBuffer
    sub x2, x1, x10                 // Longitud de la cadena en el buffer (posición actual - posición inicial)
    mov x0, #1                      // Descriptor de archivo para STDOUT
    mov x1, x10                     // Dirección inicial del buffer que contiene la serie
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

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

// Función itoa: convierte un entero a una cadena ASCII
// Entrada: w0 = número entero
// Salida: x1 = dirección de la cadena donde se almacena el resultado
itoa:
    mov x2, x1                      // Copiar la dirección del buffer al registro de trabajo
    add x2, x2, #19                 // Mover el puntero al final del espacio reservado
    mov w9, #10                     // Valor 10 en w9 para las divisiones
itoa_loop:
    udiv w3, w0, w9                 // Dividir el número por 10 usando w9
    msub w4, w3, w9, w0             // Obtener el dígito restante
    add w4, w4, '0'                 // Convertir el dígito a ASCII
    sub x2, x2, #1                  // Retroceder el puntero
    strb w4, [x2]                   // Almacenar el dígito en la cadena
    mov w0, w3                      // Continuar con el cociente
    cbnz w0, itoa_loop              // Repetir mientras haya dígitos
    mov x0, x2                      // Retornar la dirección del inicio de la cadena en x0
    ret                             // Retornar
