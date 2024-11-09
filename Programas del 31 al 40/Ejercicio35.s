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
    // Function to rotate the elements in an array
    static void RotateArray(int[] array, int size, int positions, int direction)
    {
        // Normalize positions to avoid unnecessary rotations
        positions = positions % size;

        if (positions == 0)
            return; // No rotation needed

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

// Ejercicio35.s: Función en ensamblador para rotar los elementos de un arreglo

.section .text
.global rotate_array

// Función rotate_array
// Entradas:
//   x0 = dirección del arreglo
//   x1 = tamaño del arreglo
//   x2 = cantidad de posiciones para rotar
//   x3 = dirección de rotación (0 = izquierda, 1 = derecha)
rotate_array:
    cmp x2, 0                  // Si posiciones = 0, no hay rotación
    beq end_rotate             // Terminar si no hay posiciones para rotar

    cmp x3, 0                  // Verificar dirección de rotación
    beq rotate_left            // Si es 0, rotar a la izquierda
    b rotate_right             // Si es 1, rotar a la derecha

// Rotación a la izquierda
rotate_left:
rotate_left_loop:
    ldr w4, [x0]               // Guardar el primer elemento temporalmente en w4

    mov x5, 1                  // Índice inicial para rotación izquierda
rotate_left_shift:
    cmp x5, x1                 // Comparar índice con el tamaño
    bge finish_rotate_left     // Si alcanzamos el final, terminamos el bucle interno

    ldr w6, [x0, x5, LSL #2]   // Cargar array[x5] en w6
    sub x7, x5, 1              // Calcular índice x5 - 1
    str w6, [x0, x7, LSL #2]   // Guardar array[x5] en array[x5 - 1]
    add x5, x5, 1              // Incrementar índice
    b rotate_left_shift        // Repetir el bucle interno

finish_rotate_left:
    sub x7, x1, 1              // Calcular índice final (size - 1)
    str w4, [x0, x7, LSL #2]   // Colocar el primer elemento al final
    sub x2, x2, 1              // Reducir las posiciones restantes
    cbnz x2, rotate_left_loop  // Repetir hasta que no haya más rotaciones
    b end_rotate               // Terminar

// Rotación a la derecha
rotate_right:
rotate_right_loop:
    sub x7, x1, 1              // Calcular índice final (size - 1)
    ldr w4, [x0, x7, LSL #2]   // Guardar el último elemento temporalmente en w4

    sub x5, x1, 2              // Índice inicial para rotación derecha
rotate_right_shift:
    cmp x5, -1                 // Comparar índice con -1
    blt finish_rotate_right    // Si es menor que 0, terminamos el bucle interno

    add x6, x5, 1              // Calcular índice x5 + 1
    ldr w7, [x0, x5, LSL #2]   // Cargar array[x5] en w7
    str w7, [x0, x6, LSL #2]   // Guardar array[x5] en array[x5 + 1]
    sub x5, x5, 1              // Decrementar índice
    b rotate_right_shift       // Repetir el bucle interno

finish_rotate_right:
    str w4, [x0]               // Colocar el último elemento al principio
    sub x2, x2, 1              // Reducir las posiciones restantes
    cbnz x2, rotate_right_loop // Repetir hasta que no haya más rotaciones

end_rotate:
    ret                         // Terminar la función
