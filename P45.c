
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
#include <math.h>

// Función para contar el número de dígitos de un número
int contar_digitos(int num) {
    int digitos = 0;
    while (num != 0) {
        digitos++;              // Incrementar el contador de dígitos
        num /= 10;              // Dividir el número por 10 para eliminar el último dígito
    }
    return digitos;             // Retornar el número total de dígitos
}

// Función para verificar si un número es de Armstrong
int es_armstrong(int num) {
    int digitos = contar_digitos(num);  // Obtener el número de dígitos del número
    int suma = 0;                       // Inicializar la suma a 0
    int temp = num;                     // Copiar el número para manipulación

    // Calcular la suma de los dígitos elevados a la potencia 'digitos'
    while (temp != 0) {
        int digito = temp % 10;         // Extraer el último dígito
        suma += pow(digito, digitos);   // Elevar el dígito a la potencia y sumar
        temp /= 10;                     // Eliminar el último dígito
    }

    // Verificar si la suma es igual al número original
    return suma == num;                 // Retorna verdadero si es un número de Armstrong
}

int main() {
    int num;                            // Declarar la variable para el número

    // Pedir al usuario que ingrese un número
    printf("Ingresa un número para verificar si es un número de Armstrong: ");
    scanf("%d", &num);                  // Leer el número ingresado por el usuario

    // Verificar si el número es de Armstrong
    if (es_armstrong(num)) {
        printf("%d es un número de Armstrong\n", num); // Imprimir si es un número de Armstrong
    } else {
        printf("%d no es un número de Armstrong\n", num); // Imprimir si no lo es
    }

    return 0;                           // Terminar el programa
}
*/
#include <stdio.h>
#include <math.h>

// Función para contar el número de dígitos de un número
int contar_digitos(int num) {
    int digitos = 0;
    while (num != 0) {
        digitos++;
        num /= 10;
    }
    return digitos;
}

// Función para verificar si un número es de Armstrong
int es_armstrong(int num) {
    int digitos = contar_digitos(num);
    int suma = 0;
    int temp = num;

    // Calcular la suma de los dígitos elevados a la potencia 'digitos'
    while (temp != 0) {
        int digito = temp % 10;
        suma += pow(digito, digitos);
        temp /= 10;
    }

    // Verificar si la suma es igual al número original
    return suma == num;
}

int main() {
    int num;

    // Pedir al usuario que ingrese un número
    printf("Ingresa un número para verificar si es un número de Armstrong: ");
    scanf("%d", &num);

    // Verificar si el número es de Armstrong
    if (es_armstrong(num)) {
        printf("%d es un número de Armstrong\n", num);
    } else {
        printf("%d no es un número de Armstrong\n", num);
    }

    return 0;
}
