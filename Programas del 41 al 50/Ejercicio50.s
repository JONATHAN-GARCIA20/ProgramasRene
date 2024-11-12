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
https://asciinema.org/a/uasSXuaAOXlUxwqRn75OtTpH4

// Problema en C#

using System;
using System.IO;

class Program
{
    static void Main()
    {
        string filePath = "output.txt";
        string mensaje = "Hola este seria el ultimo programa realizado en Arm!\n";

        try
        {
            // Escribir el mensaje en el archivo
            File.WriteAllText(filePath, mensaje);
            Console.WriteLine("Se ha escrito en el archivo 'output.txt' exitosamente.");
        }
        catch (Exception e)
        {
            Console.WriteLine("No se pudo abrir o escribir en el archivo.");
            Console.WriteLine($"Error: {e.Message}");
        }
    }
}

*/

#include <stdio.h>

int main() {
    FILE *file = fopen("output.txt", "w"); // Abre o crea el archivo en modo escritura
    if (file == NULL) {
        perror("No se pudo abrir el archivo");
        return 1;
    }

    const char *mensaje = "Hola este seria el ultimo programa realizado en Arm!\n";
    fprintf(file, "%s", mensaje); // Escribe el mensaje en el archivo

    fclose(file); // Cierra el archivo
    printf("Se ha escrito en el archivo 'output.txt' exitosamente.\n");

    return 0;
}
