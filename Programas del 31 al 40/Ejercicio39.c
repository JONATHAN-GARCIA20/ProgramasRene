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
https://asciinema.org/a/PuZbbA9QL2L8zdGlmbZumsv77

// Preograma en C#

using System;

class Program
{
    static void DecimalToBinary(int decimalNumber)
    {
        if (decimalNumber == 0)
        {
            Console.WriteLine("El número en binario es: 0");
            return;
        }

        int[] binary = new int[32]; // Array to store binary digits (enough for a 32-bit integer)
        int index = 0;

        // Conversion process
        while (decimalNumber > 0)
        {
            binary[index++] = decimalNumber % 2; // Store the remainder (bit) in the array
            decimalNumber /= 2;                  // Divide the number by 2
        }

        // Print the result in reverse order
        Console.Write("El número en binario es: ");
        for (int i = index - 1; i >= 0; i--)
        {
            Console.Write(binary[i]);
        }
        Console.WriteLine();
    }

    static void Main()
    {
        int decimalNumber;

        // Prompt the user for the decimal number
        Console.Write("Ingrese un número decimal: ");
        if (int.TryParse(Console.ReadLine(), out decimalNumber))
        {
            // Call the function to convert to binary
            DecimalToBinary(decimalNumber);
        }
        else
        {
            Console.WriteLine("Error: Entrada inválida. Por favor, ingrese un número entero.");
        }
    }
}

*/

#include <stdio.h>

void decimalToBinary(int decimal) {
    int binary[32];  // Arreglo para almacenar los bits (suficiente para un entero de 32 bits)
    int index = 0;

    if (decimal == 0) {
        printf("El número en binario es: 0\n");
        return;
    }

    // Proceso de conversión
    while (decimal > 0) {
        binary[index++] = decimal % 2;  // Almacena el residuo (bit) en el arreglo
        decimal = decimal / 2;          // Divide el número por 2
    }

    // Imprimir el resultado en orden inverso
    printf("El número en binario es: ");
    for (int i = index - 1; i >= 0; i--) {
        printf("%d", binary[i]);
    }
    printf("\n");
}

int main() {
    int decimal;

    // Solicitar al usuario el número decimal
    printf("Ingrese un número decimal: ");
    scanf("%d", &decimal);

    // Llamar a la función para convertir a binario
    decimalToBinary(decimal);

    return 0;
}
