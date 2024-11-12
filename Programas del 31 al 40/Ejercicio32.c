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
https://asciinema.org/a/PuZbbA9QL2L8zdGlmbZumsv77

// Preoblema en C#

using System;

class Program
{
    // Function to calculate the power of a base raised to an exponent
    static int Power(int baseNum, int exponent)
    {
        int result = 1;

        // Loop to multiply baseNum exponent times
        while (exponent > 0)
        {
            if ((exponent & 1) == 1) // If the exponent is odd
            {
                result *= baseNum;
            }
            baseNum *= baseNum; // Square the base
            exponent >>= 1;     // Divide the exponent by 2
        }

        return result;
    }

    static void Main()
    {
        int baseNum, exponent;

        // Prompt the user to enter the base and exponent
        Console.Write("Ingrese la base (x): ");
        if (!int.TryParse(Console.ReadLine(), out baseNum))
        {
            Console.WriteLine("Error: Entrada inválida para la base.");
            return;
        }

        Console.Write("Ingrese el exponente (n): ");
        if (!int.TryParse(Console.ReadLine(), out exponent))
        {
            Console.WriteLine("Error: Entrada inválida para el exponente.");
            return;
        }

        // Call the function to calculate the power
        int result = Power(baseNum, exponent);

        // Display the result
        Console.WriteLine($"Resultado de {baseNum}^{exponent}: {result}");
    }
}

*/

#include <stdio.h>

// Declaración de la función en ensamblador
extern int power(int base, int exponent);

int main() {
    int base, exponent;

    // Solicitar al usuario que ingrese la base y el exponente
    printf("Ingrese la base (x): ");
    scanf("%d", &base);
    printf("Ingrese el exponente (n): ");
    scanf("%d", &exponent);

    // Llamar a la función en ensamblador para calcular la potencia
    int result = power(base, exponent);

    // Imprimir el resultado
    printf("Resultado de %d^%d: %d\n", base, exponent, result);

    return 0;
}
