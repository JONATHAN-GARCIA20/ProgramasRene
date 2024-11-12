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
    // Function to calculate the sum of elements in an array
    static int SumArray(int[] array, int size)
    {
        int sum = 0;

        for (int i = 0; i < size; i++)
        {
            sum += array[i];
        }

        return sum;
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

        // Call the function to calculate the sum of the array
        int result = SumArray(array, size);

        // Display the result
        Console.WriteLine($"La suma de los elementos del arreglo es: {result}");
    }
}

*/

// Ejercicio33.s: Función en ensamblador para sumar los elementos de un arreglo

.section .text
.global sum_array

// Función sum_array
// Entradas: x0 = dirección del arreglo, x1 = tamaño del arreglo
// Salida: w0 = suma de los elementos del arreglo
sum_array:
    mov w2, 0                  // Inicializar la suma en 0 (acumulador)

    cmp w1, 0                  // Verificar si el tamaño es 0
    beq end_sum                // Si el tamaño es 0, retornar 0

loop:
    ldr w3, [x0], 4            // Cargar el siguiente elemento del arreglo y avanzar el puntero
    add w2, w2, w3             // Sumar el elemento al acumulador
    subs w1, w1, 1             // Decrementar el contador de tamaño
    bne loop                   // Repetir el bucle si aún hay elementos

end_sum:
    mov w0, w2                 // Mover la suma total a w0 para el retorno
    ret                        // Retornar el resultado
