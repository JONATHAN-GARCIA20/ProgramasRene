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
    // Function to calculate the length of a string
    static int StringLength(string str)
    {
        int length = 0;
        foreach (char c in str)
        {
            if (c == '\0')  // Check for null terminator (end of string)
            {
                break;
            }
            length++;
        }
        return length;
    }

    static void Main()
    {
        // Prompt the user to enter a string
        Console.Write("Ingrese una cadena: ");
        string input = Console.ReadLine();

        // Check if the input is null (error in reading input)
        if (input == null)
        {
            Console.WriteLine("Error al leer la entrada.");
            return;
        }

        // Call the function to calculate the length of the string
        int length = StringLength(input);

        // Display the length of the string
        Console.WriteLine($"La longitud de la cadena es: {length}");
    }
}

*/

// Ejercicio24.s: Función en ensamblador para calcular la longitud de una cadena
.section .text
.global string_length

string_length:
    // Entradas:
    //   x0 = dirección de la cadena
    // Salidas:
    //   w0 = longitud de la cadena

    mov w1, 0                 // Inicializar el contador de longitud en 0

count_loop:
    ldrb w2, [x0], #1         // Cargar el siguiente byte de la cadena y avanzar el puntero
    cmp w2, 0                 // Comparar con '\0' (fin de la cadena)
    beq end                   // Si es '\0', terminar
    add w1, w1, 1             // Incrementar el contador de longitud
    b count_loop              // Repetir el ciclo

end:
    mov w0, w1                // Mover el resultado al registro w0 para la salida
    ret                       // Retornar al llamador
