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

// Problema en C#

using System;

class Program
{
    // Function to find the second largest element in an array
    static int FindSecondLargest(int[] array, int size)
    {
        int largest = array[0];
        int secondLargest = array[1];

        // Initialize the largest and second largest values based on the first two elements
        if (secondLargest > largest)
        {
            // Swap if the second element is actually larger
            int temp = largest;
            largest = secondLargest;
            secondLargest = temp;
        }

        // Start checking from the third element
        for (int i = 2; i < size; i++)
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

// Ejercicio36.s: Función en ensamblador para encontrar el segundo elemento más grande en un arreglo

.section .text
.global find_second_largest

// Función find_second_largest
// Entradas: x0 = dirección del arreglo, x1 = tamaño del arreglo
// Salida: w0 = segundo elemento más grande
find_second_largest:
    ldr w2, [x0]              // Cargar el primer elemento en w2
    ldr w3, [x0, #4]          // Cargar el segundo elemento en w3

    cmp w2, w3                // Comparar los primeros dos elementos
    b.gt set_initial_values   // Si w2 > w3, continuar
    mov w4, w2                // Si w3 es más grande, w4 = w2 (segundo más grande)
    mov w2, w3                // y w2 = w3 (más grande)
    b continue_search

set_initial_values:
    mov w4, w3                // Si w2 es más grande, w4 = w3 (segundo más grande)

continue_search:
    mov x5, 2                 // Comenzar desde el tercer elemento (usar x5 en vez de w5 para cálculo de direcciones)

loop:
    cmp x5, x1                // Verificar si alcanzamos el final del arreglo
    bge end_search            // Si alcanzamos el final, terminar

    ldr w6, [x0, x5, LSL #2]  // Cargar el siguiente elemento en w6

    cmp w6, w2                // Comparar w6 con el máximo actual (w2)
    b.lt check_second_largest // Si w6 < w2, verificar si es el segundo más grande

    mov w4, w2                // Si w6 > w2, actualizar el segundo más grande a w2
    mov w2, w6                // y actualizar el máximo a w6
    b next_element            // Continuar con el siguiente elemento

check_second_largest:
    cmp w6, w4                // Comparar w6 con el segundo más grande actual (w4)
    b.le next_element         // Si w6 <= w4, no hay cambios

    mov w4, w6                // Si w6 es mayor que el segundo más grande, actualizar w4

next_element:
    add x5, x5, 1             // Avanzar al siguiente elemento (usar x5 para evitar errores de desplazamiento)
    b loop                    // Repetir el bucle

end_search:
    mov w0, w4                // Al final, w4 contiene el segundo elemento más grande
    ret                       // Retornar el resultado
