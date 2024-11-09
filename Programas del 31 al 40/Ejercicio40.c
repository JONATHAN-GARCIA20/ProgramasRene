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

// Preograma en C#

using System;

class Program
{
    static int BinaryToDecimal(long binary)
    {
        int decimalNumber = 0;
        int baseValue = 1;

        // Convert binary to decimal
        while (binary > 0)
        {
            int lastDigit = (int)(binary % 10);
            decimalNumber += lastDigit * baseValue;
            binary /= 10;
            baseValue *= 2;
        }

        return decimalNumber;
    }

    static void Main()
    {
        long binary;

        // Prompt the user for the binary number
        Console.Write("Ingrese un número binario: ");
        if (long.TryParse(Console.ReadLine(), out binary))
        {
            // Call the function to convert to decimal
            int decimalNumber = BinaryToDecimal(binary);

            // Display the result
            Console.WriteLine($"El número en decimal es: {decimalNumber}");
        }
        else
        {
            Console.WriteLine("Error: Entrada inválida. Por favor, ingrese un número binario.");
        }
    }
}

*/

#include <stdio.h>
#include <math.h>

int binaryToDecimal(long long binary) {
    int decimal = 0;
    int base = 1;

    // Convertir binario a decimal
    while (binary > 0) {
        int lastDigit = binary % 10;
        decimal += lastDigit * base;
        binary /= 10;
        base *= 2;
    }

    return decimal;
}

int main() {
    long long binary;

    // Solicitar al usuario el número binario
    printf("Ingrese un número binario: ");
    scanf("%lld", &binary);

    // Llamar a la función para convertir a decimal
    int decimal = binaryToDecimal(binary);

    // Mostrar el resultado
    printf("El número en decimal es: %d\n", decimal);

    return 0;
}
