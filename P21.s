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
// ASCIINEMA:https://asciinema.org/a/aCgOe8AJxaizhrtO8vHOZsSNq
// Función en C# para transponer una matriz 3x3
// Entradas:
//   matrix: matriz original de 3x3
// Salida:
//   transposedMatrix: matriz transpuesta de 3x3

// public static int[,] TransposeMatrix(int[,] matrix)
// {
//     int size = 3; // Tamaño de la matriz 3x3
//     int[,] transposedMatrix = new int[size, size]; // Crear la matriz transpuesta

//     for (int i = 0; i < size; i++) // Bucle externo: recorrer filas
//     {
//         for (int j = 0; j < size; j++) // Bucle interno: recorrer columnas
//         {
//             // Transponer el elemento de la posición [i, j] a [j, i]
//             transposedMatrix[j, i] = matrix[i, j];
//         }
//     }

//     return transposedMatrix;
// }

 Función en ensamblador para transponer una matriz 3x3
.section .text
.global transpose_matrix

// Entradas:
//   x0 = dirección de la matriz original
//   x1 = dirección de la matriz transpuesta
//   x2 = tamaño de la matriz (size = 3 en este caso)

transpose_matrix:
    mov w3, 0                  // Inicializar fila i = 0

outer_loop:
    cmp w3, w2                 // Comparar i con size
    bge end                    // Si i >= size, salir del bucle externo
    mov w4, 0                  // Inicializar columna j = 0

inner_loop:
    cmp w4, w2                 // Comparar j con size
    bge next_row               // Si j >= size, ir a la siguiente fila

    // Calcular la posición en la matriz original: (i * size + j)
    mul x5, x3, x2             // x5 = i * size
    add x5, x5, x4             // x5 = i * size + j
    ldr w6, [x0, x5, LSL #2]   // Cargar matrix[i][j] en w6

    // Calcular la posición en la matriz transpuesta: (j * size + i)
    mul x7, x4, x2             // x7 = j * size
    add x7, x7, x3             // x7 = j * size + i
    str w6, [x1, x7, LSL #2]   // Guardar el valor en transposed_matrix[j][i]

    add w4, w4, 1              // Incrementar j
    b inner_loop               // Repetir el bucle interno

next_row:
    add w3, w3, 1              // Incrementar i
    b outer_loop               // Repetir el bucle externo

end:
    ret                        // Retornar al llamador
