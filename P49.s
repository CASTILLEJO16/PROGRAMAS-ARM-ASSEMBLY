/*╔════════════════════════════════════════════════════════════════════╗
║                    TECNOLÓGICO NACIONAL DE MÉXICO                 ║
║                     INSTITUTO TECNOLÓGICO DE TIJUANA              ║
╠════════════════════════════════════════════════════════════════════╣
║                   Carrera: Ingeniería en Sistemas                 ║
║                   Nombre: Lennyn Alejandro Castillejo Robles      ║
║                   Matrícula: 22210880                             ║
║                   Materia: INTERFAZ DE USUARIO                    ║
║                                                                  ║
╠════════════════════════════════════════════════════════════════════╣
║                           Septiembre 2024                         ║
╚════════════════════════════════════════════════════════════════════╝
*/

/*
#include <stdio.h>
#include <unistd.h>
#include <string.h>

int main() {
    // Declarar el buffer para almacenar la entrada
    char buffer[100];

    // Mensaje de solicitud
    const char *message_prompt = "Ingrese una cadena: ";
    write(1, message_prompt, strlen(message_prompt)); // Escribir mensaje en stdout

    // Leer la entrada del usuario
    ssize_t bytes_read = read(0, buffer, sizeof(buffer)); // Leer hasta 100 caracteres desde stdin
    if (bytes_read < 0) {
        perror("Error al leer la entrada");
        return 1; // Salir si hay un error
    }

    // Mensaje de salida
    const char *message_output = "Cadena ingresada: ";
    write(1, message_output, strlen(message_output)); // Escribir mensaje en stdout

    // Escribir la cadena ingresada
    write(1, buffer, bytes_read); // Escribir la entrada del usuario en stdout

    // Salir del programa
    return 0;
}
*/

.section .data
buffer: .space 100               // Espacio para almacenar la entrada (hasta 100 caracteres)
message_prompt: .asciz "Ingrese una cadena: "
message_output: .asciz "Cadena ingresada: "

.section .text
.global _start

_start:
    // Mostrar el mensaje de solicitud
    mov x0, 1                     // Descriptor de archivo para stdout
    ldr x1, =message_prompt       // Dirección del mensaje de solicitud
    mov x2, 18                    // Longitud del mensaje
    mov x8, 64                    // Número de syscall para write
    svc 0                         // Llamada al sistema

    // Leer la entrada desde el teclado
    mov x0, 0                     // Descriptor de archivo para stdin
    ldr x1, =buffer               // Dirección del búfer donde almacenar la entrada
    mov x2, 100                   // Leer hasta 100 caracteres
    mov x8, 63                    // Número de syscall para read
    svc 0                         // Llamada al sistema

    // Mostrar el mensaje de salida
    mov x0, 1                     // Descriptor de archivo para stdout
    ldr x1, =message_output       // Dirección del mensaje de salida
    mov x2, 17                    // Longitud del mensaje
    mov x8, 64                    // Número de syscall para write
    svc 0                         // Llamada al sistema

    // Mostrar la cadena ingresada
    mov x0, 1                     // Descriptor de archivo para stdout
    ldr x1, =buffer               // Dirección del búfer con la cadena ingresada
    mov x2, 100                   // Asumimos que la cadena tiene hasta 100 caracteres
    mov x8, 64                    // Número de syscall para write
    svc 0                         // Llamada al sistema

    // Salir del programa
    mov x8, 93                    // Número de syscall para exit
    mov x0, 0                     // Código de salida
    svc 0                         // Llamada al sistema
