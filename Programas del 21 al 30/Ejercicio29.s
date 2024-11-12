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
 ║                           Septiembre 2024                          ║
 ╚════════════════════════════════════════════════════════════════════╝

//Video
https://asciinema.org/a/1USV0VHC3rVz46Hpgwt2Buqwm

// Programa en C#

using System;

class Program
{
    // Function to count the number of set bits (bits in 1) in an integer
    static int CountSetBits(int num)
    {
        int count = 0;

        while (num != 0)
        {
            count += num & 1; // Check the least significant bit
            num >>= 1;        // Shift the number to the right by 1 position
        }

        return count;
    }

    static void Main()
    {
        // Prompt the user to enter a number
        Console.Write("Ingrese un número: ");
        if (!int.TryParse(Console.ReadLine(), out int num))
        {
            Console.WriteLine("Error: Entrada inválida.");
            return;
        }

        // Call the function to count the set bits
        int result = CountSetBits(num);

        // Display the result
        Console.WriteLine($"Número de bits activados: {result}");
    }
}

*/

// Ejercicio29.s: Función en ensamblador para contar los bits activados en un número

.section .text
.global count_set_bits

// Función count_set_bits
// Entrada: x0 = número
// Salida: w0 = cantidad de bits activados (en 1)
count_set_bits:
    mov w1, 0                 // Inicializar el contador de bits en 1 en w1

count_loop:
    cmp w0, 0                 // Comparar el número con 0
    beq end_count             // Si es 0, terminar el bucle

    and w2, w0, 1             // Verificar el bit menos significativo (AND con 1)
    add w1, w1, w2            // Si el bit está en 1, incrementar el contador

    lsr w0, w0, 1             // Desplazar el número a la derecha en 1 posición (descartar el bit menos significativo)
    b count_loop              // Repetir el bucle

end_count:
    mov w0, w1                // Mover el contador al registro w0 para el resultado
    ret                       // Retornar al llamador
