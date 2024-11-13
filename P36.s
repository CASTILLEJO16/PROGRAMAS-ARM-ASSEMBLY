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

// El siguiente código está diseñado para encontrar el segundo elemento más grande de un arreglo en C#.
// Este código está completamente comentado para que no se ejecute.

//using System;

//public class Program
//{
//    // Función que encuentra el segundo elemento más grande en un arreglo
//    // Entrada: arreglo de enteros
//    // Salida: segundo elemento más grande
//    public static int FindSecondLargest(int[] array)
//    {
//        if (array.Length < 2) // Si el arreglo tiene menos de 2 elementos, no hay segundo más grande
//            throw new ArgumentException("El arreglo debe tener al menos dos elementos.");

//        int largest = array[0]; // Asumir que el primer elemento es el más grande
//        int secondLargest = array[1]; // Asumir que el segundo elemento es el segundo más grande

//        if (largest < secondLargest) // Si el segundo es mayor que el primero, intercambiarlos
//        {
//            largest = array[1];
//            secondLargest = array[0];
//        }

//        for (int i = 2; i < array.Length; i++) // Comenzar a recorrer desde el tercer elemento
//        {
//            if (array[i] > largest) // Si el elemento actual es mayor que el más grande
//            {
//                secondLargest = largest; // El más grande pasa a ser el segundo más grande
//                largest = array[i]; // Actualizar el más grande
//            }
//            else if (array[i] > secondLargest && array[i] != largest) // Si el elemento actual es mayor que el segundo más grande
//            {
//                secondLargest = array[i]; // Actualizar el segundo más grande
//            }
//        }

//        return secondLargest; // Retornar el segundo más grande
//    }

//    // Función principal
//    public static void Main()
//    {
//        // Ejemplo de uso de la función FindSecondLargest
//        int[] array = { 1, 3, 4, 5, 0 }; // Un arreglo de ejemplo
//        int secondLargest = FindSecondLargest(array); // Encontrar el segundo más grande
//        
//        Console.WriteLine("El segundo elemento más grande es: " + secondLargest); // Mostrar el resultado
//    }
//}
.section .text
.global find_second_largest

// Función find_second_largest
// Entradas: x0 = dirección del arreglo, x1 = tamaño del arreglo
// Salida: w0 = segundo elemento más grande
find_second_largest:
    ldr w2, [x0]              // Cargar el primer elemento en w2
    ldr w3, [x0, #4]          // Cargar el segundo elemento en w3

    cmp w2, w3                // Comparar los primeros dos elementos
    b.gt set_initial_values   // Si w2 > w3, continuar
    mov w4, w2                // Si w3 es más grande, w4 = w2 (segundo más grande)
    mov w2, w3                // y w2 = w3 (más grande)
    b continue_search

set_initial_values:
    mov w4, w3                // Si w2 es más grande, w4 = w3 (segundo más grande)

continue_search:
    mov x5, 2                 // Comenzar desde el tercer elemento (usar x5 en vez de w5 para cálculo de direcciones)

loop:
    cmp x5, x1                // Verificar si alcanzamos el final del arreglo
    bge end_search            // Si alcanzamos el final, terminar

    ldr w6, [x0, x5, LSL #2]  // Cargar el siguiente elemento en w6

    cmp w6, w2                // Comparar w6 con el máximo actual (w2)
    b.lt check_second_largest // Si w6 < w2, verificar si es el segundo más grande

    mov w4, w2                // Si w6 > w2, actualizar el segundo más grande a w2
    mov w2, w6                // y actualizar el máximo a w6
    b next_element            // Continuar con el siguiente elemento

check_second_largest:
    cmp w6, w4                // Comparar w6 con el segundo más grande actual (w4)
    b.le next_element         // Si w6 <= w4, no hay cambios

    mov w4, w6                // Si w6 es mayor que el segundo más grande, actualizar w4

next_element:
    add x5, x5, 1             // Avanzar al siguiente elemento (usar x5 para evitar errores de desplazamiento)
    b loop                    // Repetir el bucle

end_search:
    mov w0, w4                // Al final, w4 contiene el segundo elemento más grande
    ret                       // Retornar el resultado
