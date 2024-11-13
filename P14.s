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
// Programa en C# para realizar una búsqueda lineal en un arreglo.
/*
using System;

namespace BusquedaLineal
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] array = { 3, 5, 7, 9, 11, 13 };  // Arreglo de enteros
            int target = 9;                        // Elemento a buscar
            int resultado = BusquedaLineal(array, target);

            if (resultado != -1)
                Console.WriteLine("Elemento encontrado en la posición: " + resultado);
            else
                Console.WriteLine("Elemento no encontrado.");
        }

        static int BusquedaLineal(int[] arreglo, int objetivo)
        {
            for (int i = 0; i < arreglo.Length; i++)
            {
                if (arreglo[i] == objetivo)
                    return i;  // Devuelve la posición si encuentra el objetivo
            }
            return -1;  // Devuelve -1 si no encuentra el objetivo
        }
    }
}
*/

.section .data
array:      .word 3, 5, 7, 9, 11, 13      // Arreglo de enteros
array_len:  .word 6                       // Longitud del arreglo
target:     .word 9                       // Elemento a buscar
msg_found:  .asciz "Elemento encontrado\n" // Mensaje si encuentra
msg_not_found: .asciz "Elemento no encontrado\n" // Mensaje si no encuentra

.section .text
.global _start

_start:
    // Configuración inicial
    LDR x1, =array        // x1 = dirección del arreglo
    LDR w2, =array_len    // w2 = longitud del arreglo
    LDR w3, =target       // w3 = valor a buscar

    // Llamada a la función de búsqueda lineal
    BL linear_search

    // Verificar el resultado
    CMP w0, #-1
    BEQ print_not_found   // Si el resultado es -1, no se encontró

    // Imprimir mensaje de éxito
    MOV x0, #1            // Descriptor de archivo para STDOUT
    LDR x1, =msg_found    // Mensaje de éxito
    MOV x2, #20           // Longitud del mensaje
    MOV x8, #64           // Syscall para 'write'
    SVC #0                // Llama al sistema para imprimir el mensaje
    B exit                // Salir del programa

print_not_found:
    MOV x0, #1            // Descriptor de archivo para STDOUT
    LDR x1, =msg_not_found // Mensaje de fracaso
    MOV x2, #22           // Longitud del mensaje
    MOV x8, #64           // Syscall para 'write'
    SVC #0                // Llama al sistema para imprimir el mensaje

exit:
    MOV x8, #93           // Syscall número para salir (exit)
    SVC #0

// Función linear_search: Busca un número en un arreglo y devuelve la posición o -1.
linear_search:
    MOV w4, #0           // Inicializa el índice i = 0

loop:
    CMP w4, w2           // Compara i con la longitud del arreglo
    BGE not_found        // Si i >= n, no se encontró el valor

    LDR w5, [x1, x4, LSL #2] // Lee array[i] (4 bytes cada elemento), usando x4 como desplazamiento
    CMP w5, w3           // Compara array[i] con el valor buscado
    BEQ found            // Si son iguales, encontró el valor

    ADD w4, w4, #1       // Incrementa el índice i
    B loop               // Repite el ciclo

not_found:
    MOV w0, #-1          // Retorna -1 si no se encontró el valor
    RET

found:
    MOV w0, w4           // Retorna la posición donde se encontró el valor
    RET
