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
    static void Main()
    {
        Console.Write("Ingrese la semilla para el generador de números aleatorios: ");
        int seed = int.Parse(Console.ReadLine());

        Console.Write("Ingrese la cantidad de números aleatorios a generar: ");
        int count = int.Parse(Console.ReadLine());

        GenerateRandomNumbers(seed, count);
    }

    static void GenerateRandomNumbers(int seed, int count)
    {
        for (int i = 0; i < count; i++)
        {
            int randomNumber = RandomNumber(ref seed); // Generar el número aleatorio y actualizar la semilla
            Console.WriteLine($"Número aleatorio {i + 1}: {randomNumber}");
        }
    }

    static int RandomNumber(ref int seed)
    {
        // Parámetros del método de congruencia lineal
        const int a = 1664525;
        const int c = 1013904223;
        const int m = int.MaxValue; // 2^31 - 1 para limitar el rango a 31 bits

        // Calcular el nuevo valor: (seed * a + c) % m
        seed = (int)((long)seed * a + c) & m;

        // Devolver el número aleatorio generado
        return seed;
    }
}

*/

// Ejercicio44.s: Generador de números aleatorios en ARM64 usando el método de congruencia lineal

.section .text
.global random_number

// Función random_number
// Entrada:
//   x0 = puntero a la semilla (int *seed)
// Salida:
//   w0 = número aleatorio generado
random_number:
    ldr w1, [x0]               // Cargar el valor de la semilla en w1

    // Parámetros del método de congruencia lineal
    movz w2, 0x1955, lsl #16   // Multiplicador a (1664525)
    movk w2, 0x25ED, lsl #0    // Completar el valor de 1664525 en w2

    movz w3, 0x3C6E, lsl #16   // Incremento c (1013904223)
    movk w3, 0x0F3F, lsl #0    // Completar el valor de 1013904223 en w3

    mov w4, 0x7FFFFFFF         // Módulo m (2^31 - 1 para limitar el rango a 31 bits)

    // Calcular el nuevo valor: (seed * a + c) % m
    mul w1, w1, w2             // seed * a
    add w1, w1, w3             // seed * a + c
    and w1, w1, w4             // Aplicar el módulo m usando una máscara

    // Guardar el nuevo valor de la semilla
    str w1, [x0]               // Almacenar el nuevo valor de la semilla en la dirección original

    // Devolver el número aleatorio
    mov w0, w1                 // Mover el valor calculado a w0 para la salida
    ret                        // Retornar
