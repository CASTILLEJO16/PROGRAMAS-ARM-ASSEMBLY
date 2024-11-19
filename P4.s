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
// ║                           Octubre 2024                            ║
// ╚════════════════════════════════════════════════════════════════════╝
//ASCIINEMA:https://asciinema.org/a/KmP25EZV8IphEyhLuc2oj8sGm
// Código en C# (comentado):
/*
using System;

namespace MultiplicacionNumeros
{
    class Program
    {
        static void Main(string[] args)
        {
            // Solicitar el primer número
            Console.Write("Ingrese el primer numero: ");
            string input1 = Console.ReadLine();
            int numero1 = Atoi(input1);  // Convertir la entrada a entero

            // Solicitar el segundo número
            Console.Write("Ingrese el segundo numero: ");
            string input2 = Console.ReadLine();
            int numero2 = Atoi(input2);  // Convertir la entrada a entero

            // Realizar la multiplicación
            int resultado = numero1 * numero2;

            // Mostrar el resultado
            Console.WriteLine("Resultado de la multiplicacion: " + Itoa(resultado));
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
            return numero.ToString(); // En C# podemos usar el método ToString()
        }
    }
}
*/

// Autor: Lennyn Alejandro Castillejo Robles
// Descripción: Programa en ARM64 Assembly para RaspbianOS que multiplica dos números.
// Este programa solicita dos números del usuario, realiza la multiplicación y muestra el resultado.

.data
    prompt1:      .asciz "Ingrese el primer numero: "      // Mensaje para solicitar el primer número
    prompt2:      .asciz "Ingrese el segundo numero: "     // Mensaje para solicitar el segundo número
    resultMsg:    .asciz "Resultado de la multiplicacion: "// Mensaje para mostrar el resultado
    newline:      .asciz "\n"                              // Nueva línea
    buffer:       .space 100                               // Espacio para leer la entrada del usuario
    resultBuffer: .space 12                                // Espacio para almacenar el resultado

.text
    .global _start

_start:
    // Mostrar el mensaje para solicitar el primer número
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =prompt1                // Dirección del mensaje "Ingrese el primer numero"
    mov x2, #26                     // Longitud del mensaje
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    // Leer el primer número
    mov x0, #0                      // Descriptor de archivo para STDIN
    ldr x1, =buffer                 // Dirección del buffer para almacenar la entrada del usuario
    mov x2, #100                    // Longitud máxima a leer
    mov x8, #63                     // Syscall para 'read' (63)
    svc #0                          // Ejecutar syscall

    // Convertir la entrada (en ASCII) a un número entero
    ldr w1, =buffer                 // Dirección del buffer
    bl atoi                         // Llamar a la función atoi para conversión
    mov w4, w0                      // Almacenar el primer número en w4

    // Mostrar el mensaje para solicitar el segundo número
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =prompt2                // Dirección del mensaje "Ingrese el segundo numero"
    mov x2, #27                     // Longitud del mensaje
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    // Leer el segundo número
    mov x0, #0                      // Descriptor de archivo para STDIN
    ldr x1, =buffer                 // Dirección del buffer para almacenar la entrada del usuario
    mov x2, #100                    // Longitud máxima a leer
    mov x8, #63                     // Syscall para 'read' (63)
    svc #0                          // Ejecutar syscall

    // Convertir la entrada (en ASCII) a un número entero
    ldr w1, =buffer                 // Dirección del buffer
    bl atoi                         // Llamar a la función atoi para conversión
    mov w5, w0                      // Almacenar el segundo número en w5

    // Realizar la multiplicación (primer número * segundo número)
    mul w6, w4, w5                  // Multiplica w4 * w5 y almacena el resultado en w6

    // Mostrar mensaje "Resultado de la multiplicacion: "
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =resultMsg              // Dirección del mensaje "Resultado de la multiplicacion"
    mov x2, #33                     // Longitud del mensaje
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    // Convertir el resultado de la multiplicación a ASCII y almacenarlo en el buffer
    mov w0, w6                      // Mover el resultado de la multiplicación a w0
    ldr x1, =resultBuffer           // Dirección del buffer para el resultado
    bl itoa                         // Llamar a la función para convertir el número a ASCII

    // Mostrar el contenido del buffer con el resultado de la multiplicación
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =resultBuffer           // Dirección del buffer que contiene el resultado
    mov x2, #12                     // Longitud máxima del buffer de resultado
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
    add x2, x2, #11                 // Mover el puntero al final del espacio reservado
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
