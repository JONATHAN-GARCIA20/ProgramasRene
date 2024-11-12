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
extern int ascii_to_int(char c);

int main() {
    char input_char;

    // Solicitar al usuario que ingrese un carácter ASCII (0-9)
    printf("Ingrese un carácter ASCII (0-9): ");
    input_char = getchar();

    // Validar que el carácter ingresado esté en el rango '0'-'9'
    if (input_char < '0' || input_char > '9') {
        printf("Error: Carácter inválido.\n");
        return 1;
    }

    // Llamar a la función en ensamblador para convertir el carácter
    int result = ascii_to_int(input_char);

    // Mostrar el resultado
    printf("El valor entero convertido es: %d\n", result);
    return 0;
}
