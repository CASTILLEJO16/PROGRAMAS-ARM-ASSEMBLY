/*╔════════════════════════════════════════════════════════════════════╗
║                    TECNOLÓGICO NACIONAL DE MÉXICO                 ║
║                     INSTITUTO TECNOLÓGICO DE TIJUANA              ║
╠════════════════════════════════════════════════════════════════════╣
║                   Carrera: Ingeniería en Sistemas                 ║
║                   Nombre: Lennyn Alejandro Castillejo Robles      ║
║                   Matrícula: 22210880                             ║
║                   Materia: INTERFAZ DE USUARIO                                         ║
║                                                                                                                  ║
╠════════════════════════════════════════════════════════════════════╣
║                           Septiembre 2024                         ║
╚════════════════════════════════════════════════════════════════════╝
*/
.section .text
.global count_vowels_consonants

count_vowels_consonants:
    // Entradas:
    //   x0 = dirección de la cadena
    //   x1 = dirección donde almacenar el contador de vocales
    //   x2 = dirección donde almacenar el contador de consonantes
    // Salidas:
    //   *(x1) = número de vocales
    //   *(x2) = número de consonantes

    mov w3, 0                 // Inicializar contador de vocales en w3
    mov w4, 0                 // Inicializar contador de consonantes en w4

count_loop:
    ldrb w5, [x0], #1         // Cargar el siguiente byte de la cadena en w5 y avanzar el puntero
    cmp w5, 0                 // Comparar con '\0' (fin de la cadena)
    beq end                   // Si es '\0', terminar

    // Convertir a minúscula si es mayúscula (A-Z -> a-z)
    cmp w5, 'A'
    blt skip_case_conversion
    cmp w5, 'Z'
    bgt skip_case_conversion
    add w5, w5, #'a' - 'A'    // Convertir a minúscula sumando la diferencia

skip_case_conversion:
    // Verificar si es una vocal
    cmp w5, 'a'
    beq is_vowel
    cmp w5, 'e'
    beq is_vowel
    cmp w5, 'i'
    beq is_vowel
    cmp w5, 'o'
    beq is_vowel
    cmp w5, 'u'
    beq is_vowel

    // Si no es vocal, verificar si es consonante (a-z)
    cmp w5, 'a'
    blt count_loop            // Si es menor que 'a', no es letra
    cmp w5, 'z'
    bgt count_loop            // Si es mayor que 'z', no es letra
    add w4, w4, 1             // Incrementar contador de consonantes
    b count_loop              // Ir al siguiente carácter

is_vowel:
    add w3, w3, 1             // Incrementar contador de vocales
    b count_loop              // Ir al siguiente carácter

end:
    // Guardar los resultados en las direcciones de salida
    str w3, [x1]              // Guardar el número de vocales en *(x1)
    str w4, [x2]              // Guardar el número de consonantes en *(x2)
    ret                       // Retornar al llamador
