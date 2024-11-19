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
//ASCIINEMA: https://asciinema.org/a/U32iCkS8QehVv1mnh5RXmyqdS
/*
#include <stdio.h>

int main() {
    // Abre o crea el archivo en modo escritura
    FILE *file = fopen("output.txt", "w"); 
    if (file == NULL) { // Verificar si no se pudo abrir el archivo
        perror("No se pudo abrir el archivo"); // Imprimir mensaje de error
        return 1; // Terminar con error
    }

    // Mensaje a escribir en el archivo
    const char *mensaje = "Hola este seria el ultimo programa realizado en Arm!\n";
    
    // Escribir el mensaje en el archivo
    fprintf(file, "%s", mensaje); 

    // Cerrar el archivo después de escribir
    fclose(file); 

    // Confirmar éxito en la escritura
    printf("Se ha escrito en el archivo 'output.txt' exitosamente.\n");

    return 0; // Finalizar el programa
}
*/

#include <stdio.h>

int main() {
    FILE *file = fopen("output.txt", "w"); // Abre o crea el archivo en modo escritura
    if (file == NULL) {
        perror("No se pudo abrir el archivo");
        return 1;
    }

    const char *mensaje = "Hola este seria el ultimo programa realizado en Arm!\n";
    fprintf(file, "%s", mensaje); // Escribe el mensaje en el archivo

    fclose(file); // Cierra el archivo
    printf("Se ha escrito en el archivo 'output.txt' exitosamente.\n");

    return 0;
}
