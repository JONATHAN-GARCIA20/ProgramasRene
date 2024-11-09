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

// Problema en C#

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
        int counter = 1_000_000;  // Inicializar el contador con 1,000,000

        while (counter > 0)
        {
            counter--;  // Decrementar el contador
        }
    }
}

*/

// Ejercicio48.s: Función de ejemplo para medir el tiempo de ejecución en ARM64

.section .text
.global example_function

// Función example_function
// Esta función simplemente realiza una tarea en un bucle para simular trabajo
example_function:
    movz w0, #0xF424           // Cargar la parte baja de 1,000,000 en w0 (0xF424 en hexadecimal es 100,000)
    movk w0, #0x0, lsl #16     // Completar el valor de 1,000,000 en w0

loop:
    subs w0, w0, 1             // Restar 1 de w0 (decrementar el contador)
    bne loop                   // Si w0 no es cero, repetir el bucle

    ret                        // Retornar al finalizar
