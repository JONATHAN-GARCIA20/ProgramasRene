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
    // Function to perform bitwise AND
    static int BitwiseAnd(int a, int b)
    {
        return a & b;
    }

    // Function to perform bitwise OR
    static int BitwiseOr(int a, int b)
    {
        return a | b;
    }

    // Function to perform bitwise XOR
    static int BitwiseXor(int a, int b)
    {
        return a ^ b;
    }

    static void Main()
    {
        int num1, num2;

        // Prompt the user to enter two numbers
        Console.Write("Ingrese el primer número: ");
        if (!int.TryParse(Console.ReadLine(), out num1))
        {
            Console.WriteLine("Error: Entrada inválida para el primer número.");
            return;
        }

        Console.Write("Ingrese el segundo número: ");
        if (!int.TryParse(Console.ReadLine(), out num2))
        {
            Console.WriteLine("Error: Entrada inválida para el segundo número.");
            return;
        }

        // Perform bitwise operations
        int resultAnd = BitwiseAnd(num1, num2);
        int resultOr = BitwiseOr(num1, num2);
        int resultXor = BitwiseXor(num1, num2);

        // Display the results
        Console.WriteLine($"Resultado de AND: {resultAnd}");
        Console.WriteLine($"Resultado de OR: {resultOr}");
        Console.WriteLine($"Resultado de XOR: {resultXor}");
    }
}

*/

// Ejercicio26.s: Funciones en ensamblador para operaciones AND, OR, XOR

.section .text
.global bitwise_and
.global bitwise_or
.global bitwise_xor

// Función bitwise_and
// Entradas: x0 = primer número, x1 = segundo número
// Salida: w0 = resultado de a AND b
bitwise_and:
    and w0, w0, w1          // Realizar la operación AND
    ret                      // Retornar el resultado

// Función bitwise_or
// Entradas: x0 = primer número, x1 = segundo número
// Salida: w0 = resultado de a OR b
bitwise_or:
    orr w0, w0, w1          // Realizar la operación OR
    ret                      // Retornar el resultado

// Función bitwise_xor
// Entradas: x0 = primer número, x1 = segundo número
// Salida: w0 = resultado de a XOR b
bitwise_xor:
    eor w0, w0, w1          // Realizar la operación XOR
    ret                      // Retornar el resultado
