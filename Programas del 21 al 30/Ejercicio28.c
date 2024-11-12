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

// Problema en C#

using System;

class Program
{
    // Function to set a bit at a specific position
    static int SetBit(int num, int position)
    {
        return num | (1 << position);
    }

    // Function to clear a bit at a specific position
    static int ClearBit(int num, int position)
    {
        return num & ~(1 << position);
    }

    // Function to toggle a bit at a specific position
    static int ToggleBit(int num, int position)
    {
        return num ^ (1 << position);
    }

    static void Main()
    {
        int num, position;

        // Prompt the user to enter a number and the bit position
        Console.Write("Ingrese un número: ");
        if (!int.TryParse(Console.ReadLine(), out num))
        {
            Console.WriteLine("Error: Entrada inválida para el número.");
            return;
        }

        Console.Write("Ingrese la posición del bit (0 = menos significativo): ");
        if (!int.TryParse(Console.ReadLine(), out position) || position < 0 || position >= 32)
        {
            Console.WriteLine("Error: Entrada inválida para la posición del bit.");
            return;
        }

        // Perform bitwise operations
        int resultSet = SetBit(num, position);
        int resultClear = ClearBit(num, position);
        int resultToggle = ToggleBit(num, position);

        // Display the results
        Console.WriteLine($"Resultado después de establecer el bit: {resultSet}");
        Console.WriteLine($"Resultado después de borrar el bit: {resultClear}");
        Console.WriteLine($"Resultado después de alternar el bit: {resultToggle}");
    }
}

*/

#include <stdio.h>

// Declaración de las funciones en ensamblador
extern int set_bit(int num, int position);
extern int clear_bit(int num, int position);
extern int toggle_bit(int num, int position);

int main() {
    int num, position;

    // Solicitar al usuario que ingrese un número y la posición del bit
    printf("Ingrese un número: ");
    scanf("%d", &num);
    printf("Ingrese la posición del bit (0 = menos significativo): ");
    scanf("%d", &position);

    // Realizar las operaciones en ensamblador
    int result_set = set_bit(num, position);
    int result_clear = clear_bit(num, position);
    int result_toggle = toggle_bit(num, position);

    // Imprimir los resultados
    printf("Resultado después de establecer el bit: %d\n", result_set);
    printf("Resultado después de borrar el bit: %d\n", result_clear);
    printf("Resultado después de alternar el bit: %d\n", result_toggle);

    return 0;
}
