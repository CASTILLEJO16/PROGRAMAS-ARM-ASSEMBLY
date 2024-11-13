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

// El siguiente código está diseñado para invertir un arreglo en C#.
// Este código está completamente comentado para que no se ejecute.

//using System;

//public class Program
//{
//    // Función que invierte los elementos de un arreglo
//    // Entrada: arreglo de enteros
//    // Salida: El arreglo queda invertido en la misma dirección de memoria
//    public static void ReverseArray(int[] array)
//    {
//        int start = 0; // Índice inicial (inicio del arreglo)
//        int end = array.Length - 1; // Índice final (último elemento)

//        while (start < end) // Mientras no se crucen los índices
//        {
//            // Intercambiar array[start] y array[end]
//            int temp = array[start]; // Guardar el valor de array[start] en temp
//            array[start] = array[end]; // Guardar el valor de array[end] en array[start]
//            array[end] = temp; // Guardar el valor de temp en array[end]

//            start++; // Incrementar índice inicial
//            end--; // Decrementar índice final
//        }
//    }

//    // Función principal
//    public static void Main()
//    {
//        // Ejemplo de uso de la función ReverseArray
//        int[] array = {1, 2, 3, 4, 5}; // Un arreglo de ejemplo
//        ReverseArray(array); // Llama a la función para invertir el arreglo
//        
//        Console.WriteLine("El arreglo invertido es:");
//        foreach (var item in array)
//        {
//            Console.Write(item + " "); // Muestra el arreglo invertido
//        }
//    }
//}
.section .text
.global reverse_array

// Función reverse_array
// Entradas: x0 = dirección del arreglo, x1 = tamaño del arreglo
// Salida: El arreglo queda invertido en la misma dirección de memoria
reverse_array:
    mov w2, 0                 // Índice inicial (inicio del arreglo)
    sub w1, w1, 1             // Índice final (último elemento) -> w1 = size - 1

reverse_loop:
    cmp w2, w1                // Comparar índices (inicio >= fin)
    bge end_reverse           // Si se cruzan, terminar

    // Intercambiar array[w2] y array[w1]
    mov x3, x2                // Mover w2 a x3 para uso en cálculos de dirección
    mov x4, x1                // Mover w1 a x4 para uso en cálculos de dirección
    lsl x3, x3, 2             // Multiplicar índice w2 por 4 para obtener la dirección (tamaño de int)
    lsl x4, x4, 2             // Multiplicar índice w1 por 4 para obtener la dirección

    ldr w5, [x0, x3]          // Cargar array[w2] en w5
    ldr w6, [x0, x4]          // Cargar array[w1] en w6
    str w6, [x0, x3]          // Guardar array[w1] en array[w2]
    str w5, [x0, x4]          // Guardar array[w2] en array[w1]

    add w2, w2, 1             // Incrementar índice inicial
    sub w1, w1, 1             // Decrementar índice final
    b reverse_loop            // Repetir el bucle

end_reverse:
    ret                       // Terminar la función
