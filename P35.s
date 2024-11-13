/*╔════════════════════════════════════════════════════════════════════╗
║                    TECNOLÓGICO NACIONAL DE MÉXICO                 ║
║                     INSTITUTO TECNOLÓGICO DE TIJUANA              ║
╠════════════════════════════════════════════════════════════════════╣
║                   Carrera: Ingeniería en Sistemas                 ║
║                   Nombre: Lennyn Alejandro Castillejo Robles      ║
║                   Matrícula: 22210880                             ║
║                   Materia: INTERFAZ DE USUARIO                   ║
║                                                                 ║
╠════════════════════════════════════════════════════════════════════╣
║                           Septiembre 2024                         ║
╚════════════════════════════════════════════════════════════════════*/

// El siguiente código está diseñado para rotar un arreglo en C#.
// Este código está completamente comentado para que no se ejecute.

//using System;

//public class Program
//{
//    // Función que rota los elementos de un arreglo
//    // Entrada: arreglo de enteros, cantidad de posiciones a rotar, dirección de rotación (0 = izquierda, 1 = derecha)
//    // Salida: El arreglo se rota en la misma dirección de memoria
//    public static void RotateArray(int[] array, int positions, int direction)
//    {
//        if (positions == 0) return; // Si no hay posiciones para rotar, no hacer nada

//        int size = array.Length;
//        positions = positions % size; // Ajuste para evitar rotaciones más grandes que el tamaño

//        if (direction == 0) // Rotación a la izquierda
//        {
//            for (int i = 0; i < positions; i++) // Repetir el proceso para cada posición
//            {
//                int firstElement = array[0]; // Guardar el primer elemento temporalmente

//                // Desplazar todos los elementos hacia la izquierda
//                for (int j = 1; j < size; j++)
//                {
//                    array[j - 1] = array[j]; // Mover el elemento de la derecha a la izquierda
//                }

//                array[size - 1] = firstElement; // Colocar el primer elemento al final
//            }
//        }
//        else if (direction == 1) // Rotación a la derecha
//        {
//            for (int i = 0; i < positions; i++) // Repetir el proceso para cada posición
//            {
//                int lastElement = array[size - 1]; // Guardar el último elemento temporalmente

//                // Desplazar todos los elementos hacia la derecha
//                for (int j = size - 2; j >= 0; j--)
//                {
//                    array[j + 1] = array[j]; // Mover el elemento de la izquierda a la derecha
//                }

//                array[0] = lastElement; // Colocar el último elemento al principio
//            }
//        }
//    }

//    // Función principal
//    public static void Main()
//    {
//        // Ejemplo de uso de la función RotateArray
//        int[] array = { 1, 2, 3, 4, 5 }; // Un arreglo de ejemplo
//        RotateArray(array, 2, 0); // Rotar el arreglo 2 posiciones a la izquierda

//        Console.WriteLine("El arreglo rotado es:");
//        foreach (var item in array)
//        {
//            Console.Write(item + " "); // Muestra el arreglo rotado
//        }
//    }
//}
.section .text
.global rotate_array

// Función rotate_array
// Entradas:
//   x0 = dirección del arreglo
//   x1 = tamaño del arreglo
//   x2 = cantidad de posiciones para rotar
//   x3 = dirección de rotación (0 = izquierda, 1 = derecha)
rotate_array:
    cmp x2, 0                  // Si posiciones = 0, no hay rotación
    beq end_rotate             // Terminar si no hay posiciones para rotar

    cmp x3, 0                  // Verificar dirección de rotación
    beq rotate_left            // Si es 0, rotar a la izquierda
    b rotate_right             // Si es 1, rotar a la derecha

// Rotación a la izquierda
rotate_left:
rotate_left_loop:
    ldr w4, [x0]               // Guardar el primer elemento temporalmente en w4

    mov x5, 1                  // Índice inicial para rotación izquierda
rotate_left_shift:
    cmp x5, x1                 // Comparar índice con el tamaño
    bge finish_rotate_left     // Si alcanzamos el final, terminamos el bucle interno

    ldr w6, [x0, x5, LSL #2]   // Cargar array[x5] en w6
    sub x7, x5, 1              // Calcular índice x5 - 1
    str w6, [x0, x7, LSL #2]   // Guardar array[x5] en array[x5 - 1]
    add x5, x5, 1              // Incrementar índice
    b rotate_left_shift        // Repetir el bucle interno

finish_rotate_left:
    sub x7, x1, 1              // Calcular índice final (size - 1)
    str w4, [x0, x7, LSL #2]   // Colocar el primer elemento al final
    sub x2, x2, 1              // Reducir las posiciones restantes
    cbnz x2, rotate_left_loop  // Repetir hasta que no haya más rotaciones
    b end_rotate               // Terminar

// Rotación a la derecha
rotate_right:
rotate_right_loop:
    sub x7, x1, 1              // Calcular índice final (size - 1)
    ldr w4, [x0, x7, LSL #2]   // Guardar el último elemento temporalmente en w4

    sub x5, x1, 2              // Índice inicial para rotación derecha
rotate_right_shift:
    cmp x5, -1                 // Comparar índice con -1
    blt finish_rotate_right    // Si es menor que 0, terminamos el bucle interno

    add x6, x5, 1              // Calcular índice x5 + 1
    ldr w7, [x0, x5, LSL #2]   // Cargar array[x5] en w7
    str w7, [x0, x6, LSL #2]   // Guardar array[x5] en array[x5 + 1]
    sub x5, x5, 1              // Decrementar índice
    b rotate_right_shift       // Repetir el bucle interno

finish_rotate_right:
    str w4, [x0]               // Colocar el último elemento al principio
    sub x2, x2, 1              // Reducir las posiciones restantes
    cbnz x2, rotate_right_loop // Repetir hasta que no haya más rotaciones

end_rotate:
    ret                         // Terminar la función
