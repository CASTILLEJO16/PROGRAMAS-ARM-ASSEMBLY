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
// ASCIINEMA:https://asciinema.org/a/aCgOe8AJxaizhrtO8vHOZsSNq
.section .text
.global bitwise_and
.global bitwise_or
.global bitwise_xor

// Función bitwise_and
// Entradas: x0 = primer número, x1 = segundo número
// Salida: w0 = resultado de a AND b
bitwise_and:
    and w0, w0, w1          // Realizar la operación AND
    ret                      // Retornar el resultado

// Función bitwise_or
// Entradas: x0 = primer número, x1 = segundo número
// Salida: w0 = resultado de a OR b
bitwise_or:
    orr w0, w0, w1          // Realizar la operación OR
    ret                      // Retornar el resultado

// Función bitwise_xor
// Entradas: x0 = primer número, x1 = segundo número
// Salida: w0 = resultado de a XOR b
bitwise_xor:
    eor w0, w0, w1          // Realizar la operación XOR
    ret                      // Retornar el resultado
