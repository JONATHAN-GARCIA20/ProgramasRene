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
    // Function to set a bit at a specific position
    static int SetBit(int num, int position)
    {
        return num | (1 << position);
    }

    // Function to clear a bit at a specific position
    static int ClearBit(int num, int position)
    {
        return num & ~(1 << position);
    }

    // Function to toggle a bit at a specific position
    static int ToggleBit(int num, int position)
    {
        return num ^ (1 << position);
    }

    static void Main()
    {
        int num, position;

        // Prompt the user to enter a number and the bit position
        Console.Write("Ingrese un número: ");
        if (!int.TryParse(Console.ReadLine(), out num))
        {
            Console.WriteLine("Error: Entrada inválida para el número.");
            return;
        }

        Console.Write("Ingrese la posición del bit (0 = menos significativo): ");
        if (!int.TryParse(Console.ReadLine(), out position) || position < 0 || position >= 32)
        {
            Console.WriteLine("Error: Entrada inválida para la posición del bit.");
            return;
        }

        // Perform bitwise operations
        int resultSet = SetBit(num, position);
        int resultClear = ClearBit(num, position);
        int resultToggle = ToggleBit(num, position);

        // Display the results
        Console.WriteLine($"Resultado después de establecer el bit: {resultSet}");
        Console.WriteLine($"Resultado después de borrar el bit: {resultClear}");
        Console.WriteLine($"Resultado después de alternar el bit: {resultToggle}");
    }
}

*/

// Ejercicio28.s: Funciones en ensamblador para establecer, borrar y alternar bits

.section .text
.global set_bit
.global clear_bit
.global toggle_bit

// Función set_bit
// Entradas: x0 = número, x1 = posición del bit
// Salida: w0 = resultado con el bit establecido en 1
set_bit:
    mov w2, 1                // Colocar 1 en w2
    lsl w2, w2, w1           // Desplazar 1 a la izquierda por "posición" veces (1 << posición)
    orr w0, w0, w2           // Establecer el bit usando OR
    ret                      // Retornar el resultado

// Función clear_bit
// Entradas: x0 = número, x1 = posición del bit
// Salida: w0 = resultado con el bit borrado (establecido en 0)
clear_bit:
    mov w2, 1                // Colocar 1 en w2
    lsl w2, w2, w1           // Desplazar 1 a la izquierda por "posición" veces
    mvn w2, w2               // Invertir todos los bits para obtener una máscara con un 0 en la posición deseada
    and w0, w0, w2           // Borrar el bit usando AND
    ret                      // Retornar el resultado

// Función toggle_bit
// Entradas: x0 = número, x1 = posición del bit
// Salida: w0 = resultado con el bit alternado (cambiado entre 0 y 1)
toggle_bit:
    mov w2, 1                // Colocar 1 en w2
    lsl w2, w2, w1           // Desplazar 1 a la izquierda por "posición" veces
    eor w0, w0, w2           // Alternar el bit usando XOR
    ret                      // Retornar el resultado
