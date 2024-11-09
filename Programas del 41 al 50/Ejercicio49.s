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

// Problema en C#

using System;

class Program
{
    static void Main()
    {
        // Mostrar mensaje de solicitud
        Console.Write("Ingrese una cadena: ");

        // Leer la entrada desde el teclado
        string input = Console.ReadLine();

        // Mostrar mensaje de salida
        Console.Write("Cadena ingresada: ");

        // Mostrar la cadena ingresada
        Console.WriteLine(input);
    }
}

*/

// Ejercicio49.s: Leer entrada desde el teclado en ARM64

.section .data
buffer: .space 100               // Espacio para almacenar la entrada (hasta 100 caracteres)
message_prompt: .asciz "Ingrese una cadena: "
message_output: .asciz "Cadena ingresada: "

.section .text
.global _start

_start:
    // Mostrar el mensaje de solicitud
    mov x0, 1                     // Descriptor de archivo para stdout
    ldr x1, =message_prompt       // Dirección del mensaje de solicitud
    mov x2, 18                    // Longitud del mensaje
    mov x8, 64                    // Número de syscall para write
    svc 0                         // Llamada al sistema

    // Leer la entrada desde el teclado
    mov x0, 0                     // Descriptor de archivo para stdin
    ldr x1, =buffer               // Dirección del búfer donde almacenar la entrada
    mov x2, 100                   // Leer hasta 100 caracteres
    mov x8, 63                    // Número de syscall para read
    svc 0                         // Llamada al sistema

    // Mostrar el mensaje de salida
    mov x0, 1                     // Descriptor de archivo para stdout
    ldr x1, =message_output       // Dirección del mensaje de salida
    mov x2, 17                    // Longitud del mensaje
    mov x8, 64                    // Número de syscall para write
    svc 0                         // Llamada al sistema

    // Mostrar la cadena ingresada
    mov x0, 1                     // Descriptor de archivo para stdout
    ldr x1, =buffer               // Dirección del búfer con la cadena ingresada
    mov x2, 100                   // Asumimos que la cadena tiene hasta 100 caracteres
    mov x8, 64                    // Número de syscall para write
    svc 0                         // Llamada al sistema

    // Salir del programa
    mov x8, 93                    // Número de syscall para exit
    mov x0, 0                     // Código de salida
    svc 0                         // Llamada al sistema
