// ╔════════════════════════════════════════════════════════════════════╗
// ║                    TECNOLÓGICO NACIONAL DE MÉXICO                 ║
// ║                     INSTITUTO TECNOLÓGICO DE TIJUANA              ║
// ╠════════════════════════════════════════════════════════════════════╣
// ║                   Carrera: Ingeniería en Sistemas                 ║
// ║                   Nombre: [Tu Nombre]                             ║
// ║                   Matrícula: [Tu Matrícula]                       ║
// ║                   Materia: Programación en Ensamblador            ║
// ║                                                                   ║
// ╠════════════════════════════════════════════════════════════════════╣
// ║                           Septiembre 2024                         ║
// ╚════════════════════════════════════════════════════════════════════╝
//ASCIINEMA
//https://asciinema.org/a/b4e2JZdxrDQ7HVJzKUK3UZMFB
// Programa en C# para ordenar un arreglo usando el método de burbuja.
/*
using System;

namespace OrdenamientoBurbuja
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] array = { 5, 3, 8, 1, 2 };  // Arreglo de enteros a ordenar
            Console.WriteLine("Ordenando el array usando el método burbuja...");

            BubbleSort(array);

            Console.WriteLine("Array ordenado:");
            foreach (int num in array)
            {
                Console.WriteLine(num);
            }
        }

        static void BubbleSort(int[] arreglo)
        {
            int longitud = arreglo.Length;
            for (int i = 0; i < longitud - 1; i++)
            {
                for (int j = 0; j < longitud - 1 - i; j++)
                {
                    if (arreglo[j] > arreglo[j + 1])
                    {
                        // Intercambiar
                        int temp = arreglo[j];
                        arreglo[j] = arreglo[j + 1];
                        arreglo[j + 1] = temp;
                    }
                }
            }
        }
    }
}
*/


// Programa en ARM64 Assembly para ordenar un array de enteros con el método burbuja
// Este programa imprimirá el array ordenado después de realizar el ordenamiento

.data
    prompt:       .asciz "Ordenando el array usando el método burbuja...\n"
    sortedMsg:    .asciz "Array ordenado:\n"
    array:        .word 5, 3, 8, 1, 2   // Array a ordenar
    length:       .word 5               // Longitud del array
    newline:      .asciz "\n"           // Nueva línea

.text
    .global _start

_start:
    // Mostrar el mensaje de inicio
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =prompt                 // Dirección del mensaje de inicio
    mov x2, #43                     // Longitud del mensaje
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    // Cargar la longitud del array en w1
    ldr x1, =length                 // Dirección de la longitud
    ldr w1, [x1]                    // Cargar la longitud en w1

bubble_sort_outer:
    sub w2, w1, #1                  // w2 = length - 1 (número de pasadas)

    cmp w2, #0                      // Si w2 llega a 0, hemos terminado
    ble end_sort                    // Salir si w2 es 0 o negativo

    // Establecer el contador para el bucle interno
    mov w3, #0                      // Índice inicial del bucle interno

bubble_sort_inner:
    ldr x4, =array                  // Dirección base del array

    // Calcular la dirección de los elementos a comparar
    lsl w5, w3, #2                  // Desplazar w3 para obtener la posición en bytes
    add x6, x4, x5                  // Dirección de array[w3]
    add x7, x6, #4                  // Dirección de array[w3 + 1]

    // Cargar los valores a comparar
    ldr w8, [x6]                    // Valor en array[w3]
    ldr w9, [x7]                    // Valor en array[w3 + 1]

    // Comparar los dos valores
    cmp w8, w9
    ble no_swap                     // Si array[w3] <= array[w3 + 1], no intercambiar

    // Intercambiar los valores
    str w9, [x6]
    str w8, [x7]

no_swap:
    add w3, w3, #1                  // Incrementar índice interno
    cmp w3, w2                      // Verificar si llegamos al final de la pasada
    blt bubble_sort_inner           // Si no, repetir el bucle interno

    sub w1, w1, #1                  // Decrementar el contador externo (número de pasadas)
    b bubble_sort_outer             // Repetir el bucle externo

end_sort:
    // Mostrar el mensaje de array ordenado
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =sortedMsg              // Dirección del mensaje "Array ordenado:\n"
    mov x2, #16                     // Longitud del mensaje
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    // Imprimir los elementos del array ordenado
    mov w10, #0                     // Inicializar índice en 0

print_array:
    ldr x3, =array                  // Dirección base del array
    lsl w11, w10, #2                // Desplazamiento de w10 (w11 = w10 * 4 bytes por palabra)
    add x3, x3, x11                 // Dirección de array[w10]
    ldr w0, [x3]                    // Cargar el valor en w0

    // Convertir el número a texto (para impresión) llamando a la función print_num
    bl 
