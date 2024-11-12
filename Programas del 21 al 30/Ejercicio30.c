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
    // Function to calculate the GCD of two integers using the Euclidean algorithm
    static int Gcd(int a, int b)
    {
        while (b != 0)
        {
            int temp = b;
            b = a % b;
            a = temp;
        }
        return Math.Abs(a); // Return the absolute value of a to ensure non-negative result
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

        // Call the function to calculate the GCD
        int result = Gcd(num1, num2);

        // Display the result
        Console.WriteLine($"El Máximo Común Divisor es: {result}");
    }
}

*/

#include <stdio.h>

// Declaración de la función en ensamblador
extern int gcd(int a, int b);

int main() {
    int num1, num2;

    // Solicitar al usuario que ingrese dos números
    printf("Ingrese el primer número: ");
    scanf("%d", &num1);
    printf("Ingrese el segundo número: ");
    scanf("%d", &num2);

    // Llamar a la función en ensamblador para calcular el MCD
    int result = gcd(num1, num2);

    // Imprimir el resultado
    printf("El Máximo Común Divisor es: %d\n", result);

    return 0;
}
