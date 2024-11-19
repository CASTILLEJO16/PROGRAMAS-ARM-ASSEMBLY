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
// ║                           Septiembre 2024                         ║
// ╚════════════════════════════════════════════════════════════════════╝
//ASCIINEMA:https://asciinema.org/a/KmP25EZV8IphEyhLuc2oj8sGm
// Código en C# para calcular el factorial de un número ingresado por el usuario
/*
using System;

namespace FactorialCalculador
{
    class Program
    {
        static void Main(string[] args)
        {
            // Solicitar el número para calcular su factorial
            Console.Write("Ingrese el numero para calcular su factorial: ");
            string input = Console.ReadLine();
            int numero = Atoi(input);  // Convertir la entrada a un número entero

            // Calcular el factorial del número ingresado
            int resultado = 1;
            for (int i = 1; i <= numero; i++)
            {
                resultado *= i;
            }

            // Mostrar el resultado
            Console.WriteLine("Factorial: " + Itoa(resultado));
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
// Programa en ARM64 Assembly para calcular el factorial de un número ingresado por el usuario en RaspbianOS.

.data
    prompt:       .asciz "Ingrese el numero para calcular su factorial: " // Mensaje para solicitar el número
    resultMsg:    .asciz "Factorial: "                                    // Mensaje para mostrar el resultado
    newline:      .asciz "\n"                                              // Nueva línea
    buffer:       .space 100                                               // Espacio para leer la entrada del usuario
    resultBuffer: .space 20                                                // Espacio para almacenar el resultado

.text
    .global _start

_start:
    // Mostrar el mensaje para solicitar el número
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =prompt                 // Dirección del mensaje "Ingrese el numero para calcular su factorial: "
    mov x2, #44                     // Longitud del mensaje
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    // Leer el número
    mov x0, #0                      // Descriptor de archivo para STDIN
    ldr x1, =buffer                 // Dirección del buffer para almacenar la entrada del usuario
    mov x2, #100                    // Longitud máxima a leer
    mov x8, #63                     // Syscall para 'read' (63)
    svc #0                          // Ejecutar syscall

    // Convertir la entrada (en ASCII) a un número entero
    ldr w1, =buffer                 // Dirección del buffer
    bl atoi                         // Llamar a la función atoi para conversión
    mov w4, w0                      // Almacenar el número en w4

    // Inicializar valores para calcular el factorial
    mov w5, #1                      // w5 almacenará el resultado del factorial, inicializado en 1
    mov w6, w4                      // w6 es el contador, inicializado con el valor de N

factorial_loop:
    cbz w6, factorial_done          // Si el contador llega a 0, terminar el bucle
    mul w5, w5, w6                  // Multiplicar el resultado por el contador
    sub w6, w6, #1                  // Decrementar el contador
    b factorial_loop                // Repetir el bucle

factorial_done:
    // Mostrar mensaje "Factorial: "
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =resultMsg              // Dirección del mensaje "Factorial: "
    mov x2, #10                     // Longitud del mensaje
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    // Convertir el resultado del factorial a ASCII y almacenarlo en el buffer
    mov w0, w5                      // Mover el resultado del factorial a w0
    ldr x1, =resultBuffer           // Dirección del buffer para el resultado
    bl itoa                         // Llamar a la función para convertir el número a ASCII

    // Mostrar el contenido del buffer con el resultado del factorial
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =resultBuffer           // Dirección del buffer que contiene el resultado
    mov x2, #20                     // Longitud máxima del buffer de resultado
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    // Imprimir una nueva línea para separar el resultado del prompt de la shell
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =newline                // Dirección del carácter de nueva línea
    mov x2, #1                      // Longitud de un carácter
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

