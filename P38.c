
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

#define MAX 100  // Tamaño máximo de la cola

// Estructura para la cola
typedef struct {
    int items[MAX];
    int front, rear;
} Queue;

// Función para inicializar la cola
void initialize(Queue *q) {
    q->front = -1;
    q->rear = -1;
}

// Función para verificar si la cola está vacía
int isEmpty(Queue *q) {
    return q->front == -1;
}

// Función para verificar si la cola está llena
int isFull(Queue *q) {
    return (q->rear + 1) % MAX == q->front;
}

// Función para agregar un elemento a la cola (enqueue)
void enqueue(Queue *q, int value) {
    if (isFull(q)) {
        printf("Error: La cola está llena. No se puede agregar %d.\n", value);
    } else {
        if (isEmpty(q)) {
            q->front = 0;
        }
        q->rear = (q->rear + 1) % MAX;
        q->items[q->rear] = value;
        printf("Elemento %d agregado a la cola.\n", value);
    }
}

// Función para eliminar el elemento en el frente de la cola (dequeue)
int dequeue(Queue *q) {
    if (isEmpty(q)) {
        printf("Error: La cola está vacía. No se puede realizar dequeue.\n");
        return -1; // Devolver un valor inválido
    } else {
        int dequeuedValue = q->items[q->front];
        if (q->front == q->rear) {
            // Si la cola queda vacía después de dequeue
            q->front = -1;
            q->rear = -1;
        } else {
            q->front = (q->front + 1) % MAX;
        }
        printf("Elemento %d eliminado de la cola.\n", dequeuedValue);
        return dequeuedValue;
    }
}

// Función para mostrar el contenido de la cola
void display(Queue *q) {
    if (isEmpty(q)) {
        printf("La cola está vacía.\n");
    } else {
        printf("Contenido actual de la cola:\n");
        int i = q->front;
        while (1) {
            printf("%d ", q->items[i]);
            if (i == q->rear) break;
            i = (i + 1) % MAX;
        }
        printf("\n");
    }
}

int main() {
    Queue queue;
    initialize(&queue);

    int choice, value;

    while (1) {
        printf("\nOperaciones de la cola:\n");
        printf("1. Enqueue\n");
        printf("2. Dequeue\n");
        printf("3. Mostrar cola\n");
        printf("4. Salir\n");
        printf("Ingrese su opción: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("Ingrese el valor para enqueue: ");
                scanf("%d", &value);
                enqueue(&queue, value);
                break;
            case 2:
                dequeue(&queue);
                break;
            case 3:
                display(&queue);
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
