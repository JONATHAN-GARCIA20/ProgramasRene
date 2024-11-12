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
            result = 0; // Establecer un valor predeterminado si ocurre desbordamiento
            return true; // Indicar que ocurrió un desbordamiento
        }
    }
}

*/

// Ejercicio47.s: Detección de desbordamiento en suma en ARM64

.section .text
.global add_with_overflow_detection

// Función add_with_overflow_detection
// Entradas:
//   w0 = primer número (a)
//   w1 = segundo número (b)
//   x2 = puntero al resultado (int *result)
// Salida:
//   w0 = 1 si hay desbordamiento, 0 si no hay desbordamiento
add_with_overflow_detection:
    adds w3, w0, w1          // Sumar w0 y w1, guardar en w3 y actualizar las banderas
    bvs overflow_detected     // Si hay desbordamiento (V=1), saltar a overflow_detected

    // No hubo desbordamiento
    str w3, [x2]              // Almacenar el resultado en *result
    mov w0, 0                 // Retornar 0 indicando que no hubo desbordamiento
    ret

overflow_detected:
    mov w0, 1                 // Retornar 1 indicando que hubo desbordamiento
    ret
