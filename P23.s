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
// Convierte un número entero (0-9) en un carácter ASCII correspondiente
.section .text
.global int_to_ascii

int_to_ascii:
    // La entrada es el número en el registro w0
    // Sumar el valor ASCII de '0' (48) para obtener el carácter ASCII
    add w0, w0, #'0'
    ret
