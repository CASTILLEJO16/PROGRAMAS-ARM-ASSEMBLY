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
.global string_length

string_length:
    // Entradas:
    //   x0 = dirección de la cadena
    // Salidas:
    //   w0 = longitud de la cadena

    mov w1, 0                 // Inicializar el contador de longitud en 0

count_loop:
    ldrb w2, [x0], #1         // Cargar el siguiente byte de la cadena y avanzar el puntero
    cmp w2, 0                 // Comparar con '\0' (fin de la cadena)
    beq end                   // Si es '\0', terminar
    add w1, w1, 1             // Incrementar el contador de longitud
    b count_loop              // Repetir el ciclo

end:
    mov w0, w1                // Mover el resultado al registro w0 para la salida
    ret  
