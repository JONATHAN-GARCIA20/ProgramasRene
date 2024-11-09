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
    // Function to convert an ASCII character to an integer
    static int AsciiToInt(char asciiChar)
    {
        // Subtract '0' from the character to get the integer value
        return asciiChar - '0';
    }

    static void Main()
    {
        char asciiChar = '5';
        int result = AsciiToInt(asciiChar);

        Console.WriteLine($"The integer value of '{asciiChar}' is: {result}");
    }
}


*/

// Función: ascii_to_int
// Convierte un carácter ASCII (0-9) en un número entero
.section .text
.global ascii_to_int

ascii_to_int:
    // La entrada es el carácter en el registro w0
    // Resta el valor ASCII de '0' (48) para obtener el valor entero
    sub w0, w0, #'0'
    ret
