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
    // Function to calculate the length of a string
    static int StringLength(string str)
    {
        int length = 0;
        foreach (char c in str)
        {
            if (c == '\0')
            {
                break;
            }
            length++;
        }
        return length;
    }

    static void Main()
    {
        // Prompt the user to enter a string
        Console.Write("Ingrese una cadena: ");
        string input = Console.ReadLine();

        // Check if the input is null or empty
        if (input == null)
        {
            Console.WriteLine("Error al leer la entrada.");
            return;
        }

        // Remove the newline character at the end if it exists
        input = input.TrimEnd('\n', '\r');

        // Call the function to calculate the length of the string
        int length = StringLength(input);

        // Display the length of the string
        Console.WriteLine($"La longitud de la cadena es: {length}");
    }
}

*/

#include <stdio.h>

// Declaración de la función en ensamblador
extern int string_length(const char *str);

int main() {
    char input[256];

    // Solicitar al usuario que ingrese una cadena
    printf("Ingrese una cadena: ");
    if (fgets(input, sizeof(input), stdin) == NULL) {
        printf("Error al leer la entrada.\n");
        return 1;
    }

    // Reemplazar el salto de línea con '\0' si existe
    for (int i = 0; i < 256; i++) {
        if (input[i] == '\n') {
            input[i] = '\0';
            break;
        }
    }

    // Llamar a la función en ensamblador para calcular la longitud
    int length = string_length(input);

    // Mostrar la longitud de la cadena
    printf("La longitud de la cadena es: %d\n", length);
    return 0;
}
