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
//ASCIINEMA: https://asciinema.org/a/ha5WAgezGJ7A5yUZoJkFrdOyv

// El siguiente código está diseñado para realizar la suma de los elementos de un arreglo en C#.
// Este código está completamente comentado para que no se ejecute.

//using System;

//public class Program
//{
//    // Función que suma los elementos de un arreglo
//    // Entrada: arreglo de enteros
//    // Salida: suma de los elementos del arreglo
//    public static int SumArray(int[] array)
//    {
//        int sum = 0; // Inicializa la suma en 0

//        if (array.Length == 0) // Si el arreglo está vacío
//        {
//            return sum; // Retorna 0
//        }

//        foreach (var num in array) // Recorre el arreglo
//        {
//            sum += num; // Suma cada elemento
//        }

//        return sum; // Retorna la suma total
//    }

//    // Función principal
//    public static void Main()
//    {
//        // Ejemplo de uso de la función SumArray
//        int[] array = {1, 2, 3, 4, 5}; // Un arreglo de ejemplo
//        int result = SumArray(array);  // Llama a la función para obtener la suma
//        Console.WriteLine("La suma de los elementos del arreglo es: " + result); // Muestra el resultado
//    }
//}
.section .text
.global sum_array

// Función sum_array
// Entradas: x0 = dirección del arreglo, x1 = tamaño del arreglo
// Salida: w0 = suma de los elementos del arreglo
sum_array:
    mov w2, 0                  // Inicializar la suma en 0 (acumulador)

    cmp w1, 0                  // Verificar si el tamaño es 0
    beq end_sum                // Si el tamaño es 0, retornar 0

loop:
    ldr w3, [x0], 4            // Cargar el siguiente elemento del arreglo y avanzar el puntero
    add w2, w2, w3             // Sumar el elemento al acumulador
    subs w1, w1, 1             // Decrementar el contador de tamaño
    bne loop                   // Repetir el bucle si aún hay elementos

end_sum:
    mov w0, w2                 // Mover la suma total a w0 para el retorno
    ret                        // Retornar el resultado
