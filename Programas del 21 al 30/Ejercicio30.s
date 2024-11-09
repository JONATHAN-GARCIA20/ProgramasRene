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
    // Function to calculate the GCD of two integers using the Euclidean algorithm
    static int Gcd(int a, int b)
    {
        while (b != 0)
        {
            int remainder = a % b; // Calculate the remainder of a divided by b
            a = b;                 // Assign b to a
            b = remainder;         // Assign remainder to b
        }
        return Math.Abs(a); // Return the absolute value of a to ensure a non-negative result
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

        // Call the function to calculate the GCD
        int result = Gcd(num1, num2);

        // Display the result
        Console.WriteLine($"El Máximo Común Divisor es: {result}");
    }
}

*/

// Ejercicio30.s: Función en ensamblador para calcular el MCD de dos números usando el algoritmo de Euclides

.section .text
.global gcd

// Función gcd
// Entradas: x0 = primer número (a), x1 = segundo número (b)
// Salida: w0 = MCD de a y b
gcd:
    cmp w1, 0                // Comparar b con 0
    beq end_gcd              // Si b es 0, terminar (MCD encontrado en a)

loop:
    udiv w2, w0, w1          // Calcular a / b y guardar en w2
    msub w3, w2, w1, w0      // Calcular a % b usando a - (a / b) * b
    mov w0, w1               // Mover el valor de b a a
    mov w1, w3               // Mover el residuo (a % b) a b
    cmp w1, 0                // Comparar b con 0 nuevamente
    bne loop                 // Repetir el bucle hasta que b sea 0

end_gcd:
    mov w0, w0               // Al terminar, el MCD está en a (en w0)
    ret                      // Retornar el resultado
