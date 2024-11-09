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

        // Llamar a la función para sumar y detectar desbordamiento
        bool overflow = AddWithOverflowDetection(a, b, out int result);

        // Mostrar el resultado
        if (overflow)
        {
            Console.WriteLine($"Desbordamiento detectado en la suma de {a} y {b}.");
        }
        else
        {
            Console.WriteLine($"El resultado de la suma es: {result}");
        }
    }

    static bool AddWithOverflowDetection(int a, int b, out int result)
    {
        try
        {
            // Intentar realizar la suma en un bloque checked para detectar desbordamiento
            result = checked(a + b);
            return false; // No hay desbordamiento
        }
        catch (OverflowException)
        {
            result = 0; // Establecer un valor predeterminado
            return true; // Indicar que ocurrió un desbordamiento
        }
    }
}

*/

#include <stdio.h>

// Declaración de la función en ensamblador
extern int add_with_overflow_detection(int a, int b, int *result);

int main() {
    int a, b, result;

    // Solicitar los dos números al usuario
    printf("Ingrese el primer número: ");
    scanf("%d", &a);
    printf("Ingrese el segundo número: ");
    scanf("%d", &b);

    // Llamar a la función en ensamblador para sumar y detectar desbordamiento
    int overflow = add_with_overflow_detection(a, b, &result);

    // Mostrar el resultado
    if (overflow) {
        printf("Desbordamiento detectado en la suma de %d y %d.\n", a, b);
    } else {
        printf("El resultado de la suma es: %d\n", result);
    }

    return 0;
}
