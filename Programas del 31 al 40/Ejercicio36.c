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
    // Function to find the second largest element in an array
    static int FindSecondLargest(int[] array, int size)
    {
        int largest = int.MinValue;
        int secondLargest = int.MinValue;

        for (int i = 0; i < size; i++)
        {
            if (array[i] > largest)
            {
                secondLargest = largest;
                largest = array[i];
            }
            else if (array[i] > secondLargest && array[i] != largest)
            {
                secondLargest = array[i];
            }
        }

        return secondLargest;
    }

    static void Main()
    {
        int size;

        // Prompt the user to enter the size of the array
        Console.Write("Ingrese el tamaño del arreglo: ");
        if (!int.TryParse(Console.ReadLine(), out size) || size < 2)
        {
            Console.WriteLine("Error: El arreglo debe tener al menos 2 elementos.");
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

        // Call the function to find the second largest element
        int result = FindSecondLargest(array, size);

        // Display the result
        Console.WriteLine($"El segundo elemento más grande es: {result}");
    }
}

*/

#include <stdio.h>

// Declaración de la función en ensamblador
extern int find_second_largest(int *array, int size);

int main() {
    int size;

    // Solicitar el tamaño del arreglo
    printf("Ingrese el tamaño del arreglo: ");
    scanf("%d", &size);

    // Asegurarse de que el tamaño sea al menos 2
    if (size < 2) {
        printf("El arreglo debe tener al menos 2 elementos.\n");
        return 1;
    }

    int array[size];

    // Solicitar los elementos del arreglo
    printf("Ingrese los elementos del arreglo:\n");
    for (int i = 0; i < size; i++) {
        printf("Elemento %d: ", i);
        scanf("%d", &array[i]);
    }

    // Llamar a la función en ensamblador para encontrar el segundo elemento más grande
    int result = find_second_largest(array, size);

    // Imprimir el resultado
    printf("El segundo elemento más grande es: %d\n", result);

    return 0;
}
