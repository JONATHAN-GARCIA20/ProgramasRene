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

// Programa en C#

using System;

class Program
{
    // Function to convert an ASCII character (0-9) to an integer
    static int AsciiToInt(char c)
    {
        return c - '0';
    }

    static void Main()
    {
        // Prompt the user to enter an ASCII character (0-9)
        Console.Write("Ingrese un carácter ASCII (0-9): ");
        char inputChar = Console.ReadKey().KeyChar;
        Console.WriteLine();

        // Validate that the entered character is in the range '0'-'9'
        if (inputChar < '0' || inputChar > '9')
        {
            Console.WriteLine("Error: Carácter inválido.");
            return;
        }

        // Call the function to convert the character to an integer
        int result = AsciiToInt(inputChar);

        // Display the result
        Console.WriteLine($"El valor entero convertido es: {result}");
    }
}

*/

#include <stdio.h>

// Declaración de la función en ensamblador
extern char int_to_ascii(int num);

int main() {
    int input_num;

    // Solicitar al usuario que ingrese un número entre 0 y 9
    printf("Ingrese un número entero (0-9): ");
    scanf("%d", &input_num);

    // Validar que el número ingresado esté en el rango 0-9
    if (input_num < 0 || input_num > 9) {
        printf("Error: Número fuera de rango.\n");
        return 1;
    }

    // Llamar a la función en ensamblador para convertir el número
    char result = int_to_ascii(input_num);

    // Mostrar el resultado
    printf("El carácter ASCII correspondiente es: %c\n", result);
    return 0;
}
