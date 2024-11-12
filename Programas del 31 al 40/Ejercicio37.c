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

//Video
https://asciinema.org/a/PuZbbA9QL2L8zdGlmbZumsv77

// Programa en C#

using System;

class Stack
{
    private const int MAX = 100;  // Maximum size of the stack
    private int[] items = new int[MAX];
    private int top;

    // Constructor to initialize the stack
    public Stack()
    {
        top = -1;
    }

    // Method to check if the stack is empty
    public bool IsEmpty()
    {
        return top == -1;
    }

    // Method to check if the stack is full
    public bool IsFull()
    {
        return top == MAX - 1;
    }

    // Method to add an element to the stack (push)
    public void Push(int value)
    {
        if (IsFull())
        {
            Console.WriteLine($"Error: La pila está llena. No se puede agregar {value}.");
        }
        else
        {
            items[++top] = value;
            Console.WriteLine($"Elemento {value} agregado a la pila.");
        }
    }

    // Method to remove the top element from the stack (pop)
    public int Pop()
    {
        if (IsEmpty())
        {
            Console.WriteLine("Error: La pila está vacía. No se puede realizar pop.");
            return -1; // Return an invalid value
        }
        else
        {
            int poppedValue = items[top--];
            Console.WriteLine($"Elemento {poppedValue} eliminado de la pila.");
            return poppedValue;
        }
    }

    // Method to display the contents of the stack
    public void Display()
    {
        if (IsEmpty())
        {
            Console.WriteLine("La pila está vacía.");
        }
        else
        {
            Console.WriteLine("Contenido actual de la pila:");
            for (int i = top; i >= 0; i--)
            {
                Console.WriteLine(items[i]);
            }
        }
    }
}

class Program
{
    static void Main()
    {
        Stack stack = new Stack();
        int choice, value;

        while (true)
        {
            Console.WriteLine("\nOperaciones de la pila:");
            Console.WriteLine("1. Push");
            Console.WriteLine("2. Pop");
            Console.WriteLine("3. Mostrar pila");
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
                    Console.Write("Ingrese el valor para push: ");
                    if (int.TryParse(Console.ReadLine(), out value))
                    {
                        stack.Push(value);
                    }
                    else
                    {
                        Console.WriteLine("Valor inválido. Por favor, intente de nuevo.");
                    }
                    break;
                case 2:
                    stack.Pop();
                    break;
                case 3:
                    stack.Display();
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
