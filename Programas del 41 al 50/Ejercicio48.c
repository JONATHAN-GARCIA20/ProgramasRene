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

// Programa en C#

using System;
using System.Diagnostics;

class Program
{
    static void Main()
    {
        // Crear un Stopwatch para medir el tiempo de ejecución
        Stopwatch stopwatch = new Stopwatch();

        // Iniciar el temporizador
        stopwatch.Start();

        // Llamar a la función de ejemplo
        ExampleFunction();

        // Detener el temporizador
        stopwatch.Stop();

        // Obtener el tiempo de ejecución en segundos y nanosegundos
        double elapsedSeconds = stopwatch.Elapsed.TotalSeconds;

        // Mostrar el tiempo de ejecución
        Console.WriteLine($"Tiempo de ejecución: {elapsedSeconds:F9} segundos");
    }

    static void ExampleFunction()
    {
        // Ejemplo de función cuyo tiempo de ejecución queremos medir
        // Aquí puedes reemplazar con cualquier tarea que desees medir
        for (int i = 0; i < 1000000; i++)
        {
            // Operación de ejemplo
            Math.Sqrt(i);
        }
    }
}

*/

#include <stdio.h>
#include <time.h>

// Declaración de la función en ensamblador
extern void example_function();

int main() {
    struct timespec start, end;

    // Obtener el tiempo antes de ejecutar la función
    clock_gettime(CLOCK_MONOTONIC, &start);

    // Llamar a la función de ejemplo (en ensamblador)
    example_function();

    // Obtener el tiempo después de ejecutar la función
    clock_gettime(CLOCK_MONOTONIC, &end);

    // Calcular el tiempo de ejecución en nanosegundos
    long seconds = end.tv_sec - start.tv_sec;
    long nanoseconds = end.tv_nsec - start.tv_nsec;
    double elapsed = seconds + nanoseconds * 1e-9;

    // Mostrar el tiempo de ejecución
    printf("Tiempo de ejecución: %.9f segundos\n", elapsed);

    return 0;
}
