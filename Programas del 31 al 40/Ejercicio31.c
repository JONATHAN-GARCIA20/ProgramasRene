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

// Preoblema en C#

using System;

class Program
{
    // Function to calculate the GCD of two integers using the Euclidean algorithm
    static int Gcd(int a, int b)
    {
        while (b != 0)
        {
            int remainder = a % b;
            a = b;
            b = remainder;
        }
        return Math.Abs(a); // Return the absolute value to ensure a non-negative result
    }

    // Function to calculate the LCM of two integers using the formula LCM(a, b) = |a * b| / GCD(a, b)
    static int Lcm(int a, int b)
    {
        int gcd = Gcd(a, b);
        long product = (long)a * b; // Calculate a * b as long to prevent overflow
        return (int)(Math.Abs(product) / gcd); // Calculate LCM and cast back to int
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

        // Calculate the LCM
        int lcm = Lcm(num1, num2);

        // Display the LCM result
        Console.WriteLine($"El Mínimo Común Múltiplo es: {lcm}");
    }
}

*/

#include <stdio.h>
#include <stdlib.h>

// Declaración de la función en ensamblador para calcular el MCD
extern int gcd(int a, int b);

int main() {
    int num1, num2;

    // Solicitar al usuario que ingrese dos números
    printf("Ingrese el primer número: ");
    scanf("%d", &num1);
    printf("Ingrese el segundo número: ");
    scanf("%d", &num2);

    // Llamar a la función en ensamblador para calcular el MCD
    int mcd = gcd(num1, num2);

    // Calcular el MCM usando la fórmula MCM(a, b) = |a * b| / MCD(a, b)
    long long product = (long long)num1 * (long long)num2; // Calcular a * b como long long para evitar desbordamiento
    int mcm = abs(product) / mcd; // Dividir el valor absoluto del producto por el MCD

    // Imprimir solo el resultado del MCM
    printf("El Mínimo Común Múltiplo es: %d\n", mcm);

    return 0;
}
