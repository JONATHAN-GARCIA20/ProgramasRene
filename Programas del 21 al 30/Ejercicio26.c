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
    // Function to perform bitwise AND
    static int BitwiseAnd(int a, int b)
    {
        return a & b;
    }

    // Function to perform bitwise OR
    static int BitwiseOr(int a, int b)
    {
        return a | b;
    }

    // Function to perform bitwise XOR
    static int BitwiseXor(int a, int b)
    {
        return a ^ b;
    }

    static void Main()
    {
        int num1, num2;

        // Prompt the user to enter two numbers
        Console.Write("Ingrese el primer número: ");
        if (!int.TryParse(Console.ReadLine(), out num1))
        {
            Console.WriteLine("Error: Entrada inválida para el primer número.");
            return;
        }

        Console.Write("Ingrese el segundo número: ");
        if (!int.TryParse(Console.ReadLine(), out num2))
        {
            Console.WriteLine("Error: Entrada inválida para el segundo número.");
            return;
        }

        // Perform bitwise operations
        int resultAnd = BitwiseAnd(num1, num2);
        int resultOr = BitwiseOr(num1, num2);
        int resultXor = BitwiseXor(num1, num2);

        // Display the results
        Console.WriteLine($"Resultado de AND: {resultAnd}");
        Console.WriteLine($"Resultado de OR: {resultOr}");
        Console.WriteLine($"Resultado de XOR: {resultXor}");
    }
}

*/

#include <stdio.h>

// Declaración de las funciones en ensamblador
extern int bitwise_and(int a, int b);
extern int bitwise_or(int a, int b);
extern int bitwise_xor(int a, int b);

int main() {
    int num1, num2;

    // Solicitar al usuario que ingrese dos números
    printf("Ingrese el primer número: ");
    scanf("%d", &num1);
    printf("Ingrese el segundo número: ");
    scanf("%d", &num2);

    // Realizar las operaciones en ensamblador
    int result_and = bitwise_and(num1, num2);
    int result_or = bitwise_or(num1, num2);
    int result_xor = bitwise_xor(num1, num2);

    // Imprimir los resultados
    printf("Resultado de AND: %d\n", result_and);
    printf("Resultado de OR: %d\n", result_or);
    printf("Resultado de XOR: %d\n", result_xor);

    return 0;
}
