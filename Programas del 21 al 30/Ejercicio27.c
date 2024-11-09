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

// Problema en C#

using System;

class Program
{
    // Function to perform left shift
    static int ShiftLeft(int num, int positions)
    {
        return num << positions;
    }

    // Function to perform right shift
    static int ShiftRight(int num, int positions)
    {
        return num >> positions;
    }

    static void Main()
    {
        int num, positions;

        // Prompt the user to enter a number and the number of shift positions
        Console.Write("Ingrese un número: ");
        if (!int.TryParse(Console.ReadLine(), out num))
        {
            Console.WriteLine("Error: Entrada inválida para el número.");
            return;
        }

        Console.Write("Ingrese la cantidad de posiciones para el desplazamiento: ");
        if (!int.TryParse(Console.ReadLine(), out positions))
        {
            Console.WriteLine("Error: Entrada inválida para la cantidad de posiciones.");
            return;
        }

        // Perform bitwise shift operations
        int resultLeft = ShiftLeft(num, positions);
        int resultRight = ShiftRight(num, positions);

        // Display the results
        Console.WriteLine($"Resultado de desplazamiento a la izquierda: {resultLeft}");
        Console.WriteLine($"Resultado de desplazamiento a la derecha: {resultRight}");
    }
}

*/

#include <stdio.h>

// Declaración de las funciones en ensamblador
extern int shift_left(int num, int positions);
extern int shift_right(int num, int positions);

int main() {
    int num, positions;

    // Solicitar al usuario que ingrese un número y la cantidad de posiciones
    printf("Ingrese un número: ");
    scanf("%d", &num);
    printf("Ingrese la cantidad de posiciones para el desplazamiento: ");
    scanf("%d", &positions);

    // Realizar los desplazamientos en ensamblador
    int result_left = shift_left(num, positions);
    int result_right = shift_right(num, positions);

    // Imprimir los resultados
    printf("Resultado de desplazamiento a la izquierda: %d\n", result_left);
    printf("Resultado de desplazamiento a la derecha: %d\n", result_right);

    return 0;
}
