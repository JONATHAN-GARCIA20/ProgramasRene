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
                return a + b;  // Suma

            case '-':
                return a - b;  // Resta

            case '*':
                return a * b;  // Multiplicación

            case '/':
                if (b == 0)
                {
                    Console.WriteLine("Error: División por cero no permitida.");
                    return 0; // Retorna 0 si hay división por cero
                }
                return a / b;  // División

            default:
                Console.WriteLine("Operador no válido.");
                return 0; // Retorna 0 si el operador es inválido
        }
    }
}

*/

// Ejercicio43.s: Calculadora simple en ARM64

.section .text
.global calculate

// Función calculate
// Entradas:
//   w0 = primer número (a)
//   w1 = segundo número (b)
//   w2 = operador (op) como carácter
// Salida:
//   w0 = resultado de la operación
calculate:
    cmp w2, '+'               // Comparar el operador con '+'
    beq do_addition           // Si es '+', hacer la suma

    cmp w2, '-'               // Comparar el operador con '-'
    beq do_subtraction        // Si es '-', hacer la resta

    cmp w2, '*'               // Comparar el operador con '*'
    beq do_multiplication     // Si es '*', hacer la multiplicación

    cmp w2, '/'               // Comparar el operador con '/'
    beq do_division           // Si es '/', hacer la división

    // Si el operador es inválido, devolver 0 como resultado
    mov w0, 0
    ret

do_addition:
    add w0, w0, w1            // Realizar la suma
    ret

do_subtraction:
    sub w0, w0, w1            // Realizar la resta
    ret

do_multiplication:
    mul w0, w0, w1            // Realizar la multiplicación
    ret

do_division:
    // Comprobar si el divisor es 0 para evitar la división por cero
    cbz w1, division_by_zero  // Si b == 0, ir a manejo de división por cero
    sdiv w0, w0, w1           // Realizar la división
    ret

division_by_zero:
    mov w0, 0                 // Retornar 0 si hay división por cero
    ret
