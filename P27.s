
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
.global shift_left
.global shift_right

// Función shift_left
// Entradas: x0 = número, x1 = cantidad de posiciones
// Salida: w0 = resultado del desplazamiento a la izquierda
shift_left:
    lsl w0, w0, w1          // Desplazamiento lógico a la izquierda
    ret                      // Retornar el resultado

// Función shift_right
// Entradas: x0 = número, x1 = cantidad de posiciones
// Salida: w0 = resultado del desplazamiento a la derecha
shift_right:
    lsr w0, w0, w1          // Desplazamiento lógico a la derecha
    ret                      // Retornar el resultado
