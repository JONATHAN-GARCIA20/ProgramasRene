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
    // Function to convert an integer (0-9) to its ASCII character
    static char IntToAscii(int num)
    {
        return (char)(num + '0');
    }

    static void Main()
    {
        int inputNum;

        // Prompt the user to enter a number between 0 and 9
        Console.Write("Ingrese un número entero (0-9): ");

        // Attempt to parse the input as an integer
        if (int.TryParse(Console.ReadLine(), out inputNum))
        {
            // Validate that the number is within the range 0-9
            if (inputNum < 0 || inputNum > 9)
            {
                Console.WriteLine("Error: Número fuera de rango.");
                return;
            }

            // Call the function to convert the integer to an ASCII character
            char result = IntToAscii(inputNum);

            // Display the result
            Console.WriteLine($"El carácter ASCII correspondiente es: {result}");
        }
        else
        {
            Console.WriteLine("Error: Entrada inválida. Por favor, ingrese un número entero entre 0 y 9.");
        }
    }
}


*/

// Función: int_to_ascii
// Convierte un número entero (0-9) en un carácter ASCII correspondiente
.section .text
.global int_to_ascii

int_to_ascii:
    // La entrada es el número en el registro w0
    // Sumar el valor ASCII de '0' (48) para obtener el carácter ASCII
    add w0, w0, #'0'
    ret
