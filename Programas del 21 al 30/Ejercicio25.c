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

// Problema en C#

using System;

class Program
{
    // Function to count vowels and consonants in a string
    static void CountVowelsConsonants(string str, out int vowels, out int consonants)
    {
        vowels = 0;
        consonants = 0;

        foreach (char c in str.ToLower())  // Convert to lowercase to simplify comparisons
        {
            if (char.IsLetter(c))
            {
                // Check if the character is a vowel
                if ("aeiou".IndexOf(c) >= 0)
                {
                    vowels++;
                }
                else
                {
                    consonants++;
                }
            }
        }
    }

    static void Main()
    {
        // Prompt the user to enter a string
        Console.Write("Ingrese una cadena: ");
        string input = Console.ReadLine();

        // Check if input is null
        if (input == null)
        {
            Console.WriteLine("Error al leer la entrada.");
            return;
        }

        // Call the function to count vowels and consonants
        CountVowelsConsonants(input, out int vowels, out int consonants);

        // Display the result
        Console.WriteLine($"Número de vocales: {vowels}");
        Console.WriteLine($"Número de consonantes: {consonants}");
    }
}

*/

#include <stdio.h>

// Declaración de la función en ensamblador
extern void count_vowels_consonants(const char *str, int *vowels, int *consonants);

int main() {
    char input[256];
    int vowels = 0, consonants = 0;

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

    // Llamar a la función en ensamblador para contar vocales y consonantes
    count_vowels_consonants(input, &vowels, &consonants);

    // Mostrar el resultado
    printf("Número de vocales: %d\n", vowels);
    printf("Número de consonantes: %d\n", consonants);

    return 0;
}
