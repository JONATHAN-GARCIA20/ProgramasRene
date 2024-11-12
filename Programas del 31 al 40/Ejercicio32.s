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
https://asciinema.org/a/PuZbbA9QL2L8zdGlmbZumsv77

// Programa en C#

using System;

class Program
{
    // Function to calculate x^n using fast exponentiation
    static int Power(int baseNum, int exponent)
    {
        int result = 1; // Initialize the result as 1 (accumulator)

        while (exponent > 0)
        {
            // If the exponent is odd, multiply the result by the base
            if ((exponent & 1) == 1)
            {
                result *= baseNum;
            }

            // Square the base and shift the exponent right
            baseNum *= baseNum;
            exponent >>= 1; // Divide the exponent by 2
        }

        return result;
    }

    static void Main()
    {
        int baseNum, exponent;

        // Prompt the user to enter the base and exponent
        Console.Write("Ingrese la base (x): ");
        if (!int.TryParse(Console.ReadLine(), out baseNum))
        {
            Console.WriteLine("Error: Entrada inválida para la base.");
            return;
        }

        Console.Write("Ingrese el exponente (n): ");
        if (!int.TryParse(Console.ReadLine(), out exponent))
        {
            Console.WriteLine("Error: Entrada inválida para el exponente.");
            return;
        }

        // Call the function to calculate the power
        int result = Power(baseNum, exponent);

        // Display the result
        Console.WriteLine($"Resultado de {baseNum}^{exponent}: {result}");
    }
}

*/

// Ejercicio32.s: Función en ensamblador para calcular x^n usando exponenciación rápida

.section .text
.global power

// Función power
// Entradas: x0 = base (x), x1 = exponente (n)
// Salida: w0 = resultado de x^n
power:
    mov w2, 1                 // Inicializar el resultado en 1 (w2 es el acumulador)

    cmp w1, 0                 // Comparar el exponente con 0
    beq end_power             // Si el exponente es 0, retornar 1 (cualquier número elevado a 0 es 1)

power_loop:
    and w3, w1, 1             // Verificar si el exponente es impar (w1 & 1)
    cbz w3, skip_multiply     // Si el bit menos significativo es 0, el exponente es par, saltar la multiplicación
    mul w2, w2, w0            // Multiplicar el acumulador por la base

skip_multiply:
    mul w0, w0, w0            // Elevar la base al cuadrado (base *= base)
    lsr w1, w1, 1             // Dividir el exponente por 2 (exponente >>= 1)
    cmp w1, 0                 // Verificar si el exponente es 0
    bne power_loop            // Repetir el bucle si el exponente aún no es 0

end_power:
    mov w0, w2                // Mover el resultado acumulado a w0 para el retorno
    ret                       // Retornar el resultado
