/*
 ╔════════════════════════════════════════════════════════════════════╗
 ║                    TECNOLÓGICO NACIONAL DE MÉXICO                  ║
 ║                   INSTITUTO TECNOLÓGICO DE TIJUANA                 ║
 ╠════════════════════════════════════════════════════════════════════╣
 ║            Carrera: Ingeniería en Sistemas Computacionales         ║
 ║                    Nombre: Garcia Santos Jonathan                  ║
 ║                         Matrícula: 22210307                        ║
 ║                    Materia: Lenguaje de Interfaz                   ║
 ║                                                                    ║
 ╠════════════════════════════════════════════════════════════════════╣
 ║                           Noviembre 2024                           ║
 ╚════════════════════════════════════════════════════════════════════╝

// Preograma en C#

using System;

class Queue
{
    private const int MAX = 100;  // Maximum size of the queue
    private int[] items = new int[MAX];
    private int front;
    private int rear;

    // Constructor to initialize the queue
    public Queue()
    {
        front = -1;
        rear = -1;
    }

    // Method to check if the queue is empty
    public bool IsEmpty()
    {
        return front == -1;
    }

    // Method to check if the queue is full
    public bool IsFull()
    {
        return (rear + 1) % MAX == front;
    }

    // Method to add an element to the queue (enqueue)
    public void Enqueue(int value)
    {
        if (IsFull())
        {
            Console.WriteLine($"Error: La cola está llena. No se puede agregar {value}.");
        }
        else
        {
            if (IsEmpty())
            {
                front = 0;
            }
            rear = (rear + 1) % MAX;
            items[rear] = value;
            Console.WriteLine($"Elemento {value} agregado a la cola.");
        }
    }

    // Method to remove the front element from the queue (dequeue)
    public int Dequeue()
    {
        if (IsEmpty())
        {
            Console.WriteLine("Error: La cola está vacía. No se puede realizar dequeue.");
            return -1; // Return an invalid value
        }
        else
        {
            int dequeuedValue = items[front];
            if (front == rear)
            {
                // If the queue becomes empty after dequeue
                front = -1;
                rear = -1;
            }
            else
            {
                front = (front + 1) % MAX;
            }
            Console.WriteLine($"Elemento {dequeuedValue} eliminado de la cola.");
            return dequeuedValue;
        }
    }

    // Method to display the contents of the queue
    public void Display()
    {
        if (IsEmpty())
        {
            Console.WriteLine("La cola está vacía.");
        }
        else
        {
            Console.WriteLine("Contenido actual de la cola:");
            int i = front;
            while (true)
            {
                Console.Write(items[i] + " ");
                if (i == rear) break;
                i = (i + 1) % MAX;
            }
            Console.WriteLine();
        }
    }
}

class Program
{
    static void Main()
    {
        Queue queue = new Queue();
        int choice, value;

        while (true)
        {
            Console.WriteLine("\nOperaciones de la cola:");
            Console.WriteLine("1. Enqueue");
            Console.WriteLine("2. Dequeue");
            Console.WriteLine("3. Mostrar cola");
            Console.WriteLine("4. Salir");
            Console.Write("Ingrese su opción: ");
            if (!int.TryParse(Console.ReadLine(), out choice))
            {
                Console.WriteLine("Opción inválida. Por favor, intente de nuevo.");
                continue;
            }

            switch (choice)
            {
                case 1:
                    Console.Write("Ingrese el valor para enqueue: ");
                    if (int.TryParse(Console.ReadLine(), out value))
                    {
                        queue.Enqueue(value);
                    }
                    else
                    {
                        Console.WriteLine("Valor inválido. Por favor, intente de nuevo.");
                    }
                    break;
                case 2:
                    queue.Dequeue();
                    break;
                case 3:
                    queue.Display();
                    break;
                case 4:
                    Console.WriteLine("Saliendo del programa.");
                    return;
                default:
                    Console.WriteLine("Opción inválida. Por favor, intente de nuevo.");
                    break;
            }
        }
    }
}

*/

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
