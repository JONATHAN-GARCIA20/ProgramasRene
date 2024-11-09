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
    // Function to reverse the elements in an array
    static void ReverseArray(int[] array, int size)
    {
        int left = 0;           // Starting index
        int right = size - 1;   // Ending index

        while (left < right)
        {
            // Swap elements at left and right indices
            int temp = array[left];
            array[left] = array[right];
            array[right] = temp;

            left++;  // Move the left index forward
            right--; // Move the right index backward
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

// Ejercicio34.s: Función en ensamblador para invertir los elementos de un arreglo

.section .text
.global reverse_array

// Función reverse_array
// Entradas: x0 = dirección del arreglo, x1 = tamaño del arreglo
// Salida: El arreglo queda invertido en la misma dirección de memoria
reverse_array:
    mov w2, 0                 // Índice inicial (inicio del arreglo)
    sub w1, w1, 1             // Índice final (último elemento) -> w1 = size - 1

reverse_loop:
    cmp w2, w1                // Comparar índices (inicio >= fin)
    bge end_reverse           // Si se cruzan, terminar

    // Intercambiar array[w2] y array[w1]
    mov x3, x2                // Mover w2 a x3 para uso en cálculos de dirección
    mov x4, x1                // Mover w1 a x4 para uso en cálculos de dirección
    lsl x3, x3, 2             // Multiplicar índice w2 por 4 para obtener la dirección (tamaño de int)
    lsl x4, x4, 2             // Multiplicar índice w1 por 4 para obtener la dirección

    ldr w5, [x0, x3]          // Cargar array[w2] en w5
    ldr w6, [x0, x4]          // Cargar array[w1] en w6
    str w6, [x0, x3]          // Guardar array[w1] en array[w2]
    str w5, [x0, x4]          // Guardar array[w2] en array[w1]

    add w2, w2, 1             // Incrementar índice inicial
    sub w1, w1, 1             // Decrementar índice final
    b reverse_loop            // Repetir el bucle

end_reverse:
    ret                       // Terminar la función
