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

class Program
{
    // Function to rotate the elements in an array
    static void RotateArray(int[] array, int size, int positions, int direction)
    {
        // Normalize positions to avoid unnecessary rotations
        positions = positions % size;

        if (direction == 0) // Rotate left
        {
            RotateLeft(array, size, positions);
        }
        else if (direction == 1) // Rotate right
        {
            RotateRight(array, size, positions);
        }
    }

    // Helper function to rotate the array left by a given number of positions
    static void RotateLeft(int[] array, int size, int positions)
    {
        Reverse(array, 0, positions - 1);
        Reverse(array, positions, size - 1);
        Reverse(array, 0, size - 1);
    }

    // Helper function to rotate the array right by a given number of positions
    static void RotateRight(int[] array, int size, int positions)
    {
        Reverse(array, 0, size - positions - 1);
        Reverse(array, size - positions, size - 1);
        Reverse(array, 0, size - 1);
    }

    // Helper function to reverse elements in a portion of the array
    static void Reverse(int[] array, int start, int end)
    {
        while (start < end)
        {
            int temp = array[start];
            array[start] = array[end];
            array[end] = temp;
            start++;
            end--;
        }
    }

    static void Main()
    {
        int size, positions, direction;

        // Prompt the user to enter the size of the array
        Console.Write("Ingrese el tamaño del arreglo: ");
        if (!int.TryParse(Console.ReadLine(), out size) || size <= 0)
        {
            Console.WriteLine("Error: Tamaño del arreglo inválido.");
            return;
        }

        int[] array = new int[size];

        // Prompt the user to enter the elements of the array
        Console.WriteLine("Ingrese los elementos del arreglo:");
        for (int i = 0; i < size; i++)
        {
            Console.Write($"Elemento {i}: ");
            if (!int.TryParse(Console.ReadLine(), out array[i]))
            {
                Console.WriteLine("Error: Entrada inválida para el elemento.");
                return;
            }
        }

        // Prompt for the number of positions and direction
        Console.Write("Ingrese la cantidad de posiciones para rotar: ");
        if (!int.TryParse(Console.ReadLine(), out positions) || positions < 0)
        {
            Console.WriteLine("Error: Número de posiciones inválido.");
            return;
        }

        Console.Write("Ingrese la dirección de la rotación (0 = izquierda, 1 = derecha): ");
        if (!int.TryParse(Console.ReadLine(), out direction) || (direction != 0 && direction != 1))
        {
            Console.WriteLine("Error: Dirección inválida.");
            return;
        }

        // Call the function to rotate the array
        RotateArray(array, size, positions, direction);

        // Display the rotated array
        Console.WriteLine("Arreglo rotado:");
        for (int i = 0; i < size; i++)
        {
            Console.Write(array[i] + " ");
        }
        Console.WriteLine();
    }
}

*/

#include <stdio.h>

// Declaración de la función en ensamblador
extern void rotate_array(int *array, int size, int positions, int direction);

int main() {
    int size, positions, direction;

    // Solicitar el tamaño del arreglo
    printf("Ingrese el tamaño del arreglo: ");
    scanf("%d", &size);

    int array[size];

    // Solicitar los elementos del arreglo
    printf("Ingrese los elementos del arreglo:\n");
    for (int i = 0; i < size; i++) {
        printf("Elemento %d: ", i);
        scanf("%d", &array[i]);
    }

    // Solicitar la cantidad de posiciones y la dirección de rotación
    printf("Ingrese la cantidad de posiciones para rotar: ");
    scanf("%d", &positions);
    printf("Ingrese la dirección de la rotación (0 = izquierda, 1 = derecha): ");
    scanf("%d", &direction);

    // Llamar a la función en ensamblador para rotar el arreglo
    rotate_array(array, size, positions, direction);

    // Imprimir el arreglo rotado
    printf("Arreglo rotado:\n");
    for (int i = 0; i < size; i++) {
        printf("%d ", array[i]);
    }
    printf("\n");

    return 0;
}
