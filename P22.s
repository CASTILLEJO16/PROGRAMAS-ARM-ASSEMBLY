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
.global ascii_to_int

ascii_to_int:
    // La entrada es el carácter en el registro w0
    // Resta el valor ASCII de '0' (48) para obtener el valor entero
    sub w0, w0, #'0'
    ret
