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
    // Function to reverse the elements in an array
    static void ReverseArray(int[] array, int size)
    {
        int left = 0;
        int right = size - 1;

        while (left < right)
        {
            // Swap the elements at left and right indices
            int temp = array[left];
            array[left] = array[right];
            array[right] = temp;

            left++;
            right--;
        }
    }

    static void Main()
    {
        int size;

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

        // Call the function to reverse the array
        ReverseArray(array, size);

        // Display the reversed array
        Console.WriteLine("Arreglo invertido:");
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
extern void reverse_array(int *array, int size);

int main() {
    int size;

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

    // Llamar a la función en ensamblador para invertir el arreglo
    reverse_array(array, size);

    // Imprimir el arreglo invertido
    printf("Arreglo invertido:\n");
    for (int i = 0; i < size; i++) {
        printf("%d ", array[i]);
    }
    printf("\n");

    return 0;
}
