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

// Programa en C#

using System;

class Program
{
    static void Main()
    {
        const int MAX_STRINGS = 10;

        Console.Write($"Ingrese el número de cadenas (máximo {MAX_STRINGS}): ");
        if (!int.TryParse(Console.ReadLine(), out int n) || n < 2 || n > MAX_STRINGS)
        {
            Console.WriteLine("Debe ingresar al menos dos cadenas para comparar y no más de diez.");
            return;
        }

        string[] strings = new string[n];

        // Leer las cadenas
        for (int i = 0; i < n; i++)
        {
            Console.Write($"Ingrese la cadena {i + 1}: ");
            strings[i] = Console.ReadLine();
        }

        // Llamar a la función para encontrar el prefijo común
        string prefix = LongestCommonPrefix(strings);

        // Mostrar el resultado
        if (prefix.Length > 0)
        {
            Console.WriteLine($"El prefijo común más largo es: {prefix}");
        }
        else
        {
            Console.WriteLine("No hay un prefijo común.");
        }
    }

    static string LongestCommonPrefix(string[] strings)
    {
        if (strings.Length == 0) return "";

        // Inicializar el prefijo con la primera cadena
        string prefix = strings[0];

        // Comparar el prefijo con cada cadena
        for (int i = 1; i < strings.Length; i++)
        {
            while (strings[i].IndexOf(prefix) != 0)
            {
                prefix = prefix.Substring(0, prefix.Length - 1); // Reducir el prefijo en uno
                if (prefix == "") return ""; // No hay prefijo común
            }
        }

        return prefix;
    }
}

*/

#include <stdio.h>
#include <string.h>

#define MAX_STRINGS 10
#define MAX_LENGTH 100

// Declaración de la función en ensamblador
extern int longest_common_prefix(char *strings[], int count, char *prefix);

int main() {
    int n;
    char strings[MAX_STRINGS][MAX_LENGTH];
    char *string_ptrs[MAX_STRINGS];  // Punteros a las cadenas

    // Solicitar el número de cadenas
    printf("Ingrese el número de cadenas (máximo %d): ", MAX_STRINGS);
    scanf("%d", &n);

    if (n < 2) {
        printf("Debe ingresar al menos dos cadenas para comparar.\n");
        return 1;
    }

    // Limpiar el buffer de entrada
    getchar();

    // Leer las cadenas
    for (int i = 0; i < n; i++) {
        printf("Ingrese la cadena %d: ", i + 1);
        fgets(strings[i], MAX_LENGTH, stdin);

        // Eliminar el salto de línea al final de la cadena
        strings[i][strcspn(strings[i], "\n")] = '\0';
        string_ptrs[i] = strings[i];  // Almacenar el puntero a cada cadena
    }

    char prefix[MAX_LENGTH];  // Para almacenar el prefijo común

    // Llamar a la función en ensamblador para encontrar el prefijo común
    int prefix_length = longest_common_prefix(string_ptrs, n, prefix);

    // Mostrar el resultado
    if (prefix_length > 0) {
        printf("El prefijo común más largo es: %s\n", prefix);
    } else {
        printf("No hay un prefijo común.\n");
    }

    return 0;
}
