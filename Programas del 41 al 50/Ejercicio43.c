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
        Console.Write("Ingrese el primer número: ");
        int a = int.Parse(Console.ReadLine());

        Console.Write("Ingrese el segundo número: ");
        int b = int.Parse(Console.ReadLine());

        Console.Write("Ingrese la operación (+, -, *, /): ");
        char op = Console.ReadLine()[0];

        int result = Calculate(a, b, op);

        Console.WriteLine($"El resultado de {a} {op} {b} es: {result}");
    }

    static int Calculate(int a, int b, char op)
    {
        switch (op)
        {
            case '+':
                return a + b;
            case '-':
                return a - b;
            case '*':
                return a * b;
            case '/':
                if (b == 0)
                {
                    Console.WriteLine("Error: División por cero no permitida.");
                    return 0; // Devuelve 0 en caso de división por cero
                }
                return a / b;
            default:
                Console.WriteLine("Operador no válido.");
                return 0; // Devuelve 0 si el operador es inválido
        }
    }
}

*/

#include <stdio.h>

// Declaración de la función en ensamblador
extern int calculate(int a, int b, char op);

int main() {
    int a, b;
    char op;
    int result;

    // Solicitar al usuario los dos números
    printf("Ingrese el primer número: ");
    scanf("%d", &a);
    printf("Ingrese el segundo número: ");
    scanf("%d", &b);

    // Solicitar al usuario la operación
    printf("Ingrese la operación (+, -, *, /): ");
    scanf(" %c", &op);  // Espacio antes de %c para ignorar saltos de línea

    // Llamar a la función en ensamblador para realizar la operación
    result = calculate(a, b, op);

    // Mostrar el resultado
    printf("El resultado de %d %c %d es: %d\n", a, op, b, result);

    return 0;
}
