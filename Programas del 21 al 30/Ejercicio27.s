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
    // Function to perform left logical shift
    static int ShiftLeft(int num, int positions)
    {
        return num << positions;
    }

    // Function to perform right logical shift
    static int ShiftRight(int num, int positions)
    {
        // Use unsigned shift by converting to uint first, to match logical (not arithmetic) right shift behavior
        return (int)((uint)num >> positions);
    }

    static void Main()
    {
        int num, positions;

        // Prompt the user to enter a number and the number of shift positions
        Console.Write("Ingrese un número: ");
        if (!int.TryParse(Console.ReadLine(), out num))
        {
            Console.WriteLine("Error: Entrada inválida para el número.");
            return;
        }

        Console.Write("Ingrese la cantidad de posiciones para el desplazamiento: ");
        if (!int.TryParse(Console.ReadLine(), out positions))
        {
            Console.WriteLine("Error: Entrada inválida para la cantidad de posiciones.");
            return;
        }

        // Perform logical shift operations
        int resultLeft = ShiftLeft(num, positions);
        int resultRight = ShiftRight(num, positions);

        // Display the results
        Console.WriteLine($"Resultado de desplazamiento a la izquierda: {resultLeft}");
        Console.WriteLine($"Resultado de desplazamiento a la derecha: {resultRight}");
    }
}

*/

// Ejercicio27.s: Funciones en ensamblador para desplazamientos a la izquierda y derecha

.section .text
.global shift_left
.global shift_right

// Función shift_left
// Entradas: x0 = número, x1 = cantidad de posiciones
// Salida: w0 = resultado del desplazamiento a la izquierda
shift_left:
    lsl w0, w0, w1          // Desplazamiento lógico a la izquierda
    ret                      // Retornar el resultado

// Función shift_right
// Entradas: x0 = número, x1 = cantidad de posiciones
// Salida: w0 = resultado del desplazamiento a la derecha
shift_right:
    lsr w0, w0, w1          // Desplazamiento lógico a la derecha
    ret                      // Retornar el resultado
