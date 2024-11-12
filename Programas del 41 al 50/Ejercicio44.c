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
https://asciinema.org/a/uasSXuaAOXlUxwqRn75OtTpH4

// Programa en C#

using System;

class Program
{
    static void Main()
    {
        Console.Write("Ingrese la semilla para el generador de números aleatorios: ");
        int seed = int.Parse(Console.ReadLine());

        Console.Write("Ingrese la cantidad de números aleatorios a generar: ");
        int count = int.Parse(Console.ReadLine());

        // Generar y mostrar los números aleatorios
        GenerateRandomNumbers(seed, count);
    }

    static void GenerateRandomNumbers(int seed, int count)
    {
        Random random = new Random(seed); // Inicializar el generador de números aleatorios con la semilla

        for (int i = 0; i < count; i++)
        {
            int num = random.Next(); // Generar el siguiente número aleatorio
            Console.WriteLine($"Número aleatorio {i + 1}: {num}");
        }
    }
}

*/

#include <stdio.h>

// Declaración de la función en ensamblador
extern int random_number(int *seed);

// Función para inicializar y generar múltiples números aleatorios
void generate_random_numbers(int seed, int count) {
    for (int i = 0; i < count; i++) {
        int num = random_number(&seed);  // Llamada a la función ensambladora
        printf("Número aleatorio %d: %d\n", i + 1, num);
    }
}

int main() {
    int seed, count;

    // Solicitar la semilla
    printf("Ingrese la semilla para el generador de números aleatorios: ");
    scanf("%d", &seed);

    // Solicitar la cantidad de números aleatorios
    printf("Ingrese la cantidad de números aleatorios a generar: ");
    scanf("%d", &count);

    // Generar y mostrar los números aleatorios
    generate_random_numbers(seed, count);

    return 0;
}
