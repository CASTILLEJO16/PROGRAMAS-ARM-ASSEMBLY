

/*╔════════════════════════════════════════════════════════════════════╗
║                    TECNOLÓGICO NACIONAL DE MÉXICO                 ║
║                     INSTITUTO TECNOLÓGICO DE TIJUANA              ║
╠════════════════════════════════════════════════════════════════════╣
║                   Carrera: Ingeniería en Sistemas                 ║
║                   Nombre: Lennyn Alejandro Castillejo Robles      ║
║                   Matrícula: 22210880                             ║
║                   Materia: INTERFAZ DE USUARIO                   ║
║                                                                 ║
╠════════════════════════════════════════════════════════════════════╣
║                           Septiembre 2024                         ║
╚════════════════════════════════════════════════════════════════════*/
//ASCIINEMA: https://asciinema.org/a/ha5WAgezGJ7A5yUZoJkFrdOyv

#include <stdio.h>
#include <stdlib.h>

#define MAX 100  // Tamaño máximo de la pila

// Estructura para la pila
typedef struct {
    int items[MAX];
    int top;
} Stack;

// Función para inicializar la pila
void initialize(Stack *s) {
    s->top = -1;
}

// Función para verificar si la pila está vacía
int isEmpty(Stack *s) {
    return s->top == -1;
}

// Función para verificar si la pila está llena
int isFull(Stack *s) {
    return s->top == MAX - 1;
}

// Función para agregar un elemento a la pila (push)
void push(Stack *s, int value) {
    if (isFull(s)) {
        printf("Error: La pila está llena. No se puede agregar %d.\n", value);
    } else {
        s->items[++s->top] = value;
        printf("Elemento %d agregado a la pila.\n", value);
    }
}

// Función para eliminar el elemento en el tope de la pila (pop)
int pop(Stack *s) {
    if (isEmpty(s)) {
        printf("Error: La pila está vacía. No se puede realizar pop.\n");
        return -1; // Devolver un valor inválido
    } else {
        int poppedValue = s->items[s->top--];
        printf("Elemento %d eliminado de la pila.\n", poppedValue);
        return poppedValue;
    }
}

// Función para mostrar el contenido de la pila
void display(Stack *s) {
    if (isEmpty(s)) {
        printf("La pila está vacía.\n");
    } else {
        printf("Contenido actual de la pila:\n");
        for (int i = s->top; i >= 0; i--) {
            printf("%d\n", s->items[i]);
        }
    }
}

int main() {
    Stack stack;
    initialize(&stack);

    int choice, value;

    while (1) {
        printf("\nOperaciones de la pila:\n");
        printf("1. Push\n");
        printf("2. Pop\n");
        printf("3. Mostrar pila\n");
        printf("4. Salir\n");
        printf("Ingrese su opción: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("Ingrese el valor para push: ");
                scanf("%d", &value);
                push(&stack, value);
                break;
            case 2:
                pop(&stack);
                break;
            case 3:
                display(&stack);
                break;
            case 4:
                printf("Saliendo del programa.\n");
                exit(0);
            default:
                printf("Opción inválida. Por favor, intente de nuevo.\n");
        }
    }

    return 0;
}
