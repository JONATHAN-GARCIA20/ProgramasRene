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
https://asciinema.org/a/dj85vW0pX5C2JM6dtd0KZqMlP

//Programa en C#

using System;

class Program
{
    static void Main()
    {
        while (true)
        {
            // Solicitar la cadena al usuario
            Console.Write("Ingrese una cadena para invertir: ");
            string input = Console.ReadLine();

            // Verificar si la entrada es válida
            if (string.IsNullOrEmpty(input))
            {
                Console.WriteLine("La cadena ingresada está vacía. Por favor, intente nuevamente.\n");
                continue;
            }

            // Invertir la cadena
            string inverted = ReverseString(input);

            // Mostrar el resultado
            Console.WriteLine("Cadena invertida: " + inverted + "\n");
        }
    }

    // Función para invertir una cadena
    static string ReverseString(string input)
    {
        char[] invertedArray = input.ToCharArray();
        Array.Reverse(invertedArray);
        return new string(invertedArray);
    }
}

*/

// Programa en ARM64 Assembly para RaspbianOS que invierte una cadena ingresada por el usuario
// Este programa usa un segundo buffer para almacenar la cadena invertida y luego la muestra.

.data
    prompt:       .asciz "Ingrese una cadena para invertir: "       // Mensaje para solicitar la cadena
    resultMsg:    .asciz "Cadena invertida: "                       // Mensaje antes de mostrar la cadena invertida
    newline:      .asciz "\n"                                       // Nueva línea
    buffer:       .space 100                                        // Espacio para leer la entrada del usuario
    invertedBuffer: .space 100                                      // Espacio para almacenar la cadena invertida

.text
    .global _start

_start:
    // Mostrar el mensaje para solicitar la cadena
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =prompt                 // Dirección del mensaje "Ingrese una cadena para invertir: "
    mov x2, #33                     // Longitud del mensaje
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    // Leer la cadena ingresada por el usuario
    mov x0, #0                      // Descriptor de archivo para STDIN
    ldr x1, =buffer                 // Dirección del buffer para almacenar la entrada del usuario
    mov x2, #100                    // Longitud máxima a leer
    mov x8, #63                     // Syscall para 'read' (63)
    svc #0                          // Ejecutar syscall

    // Calcular la longitud de la cadena y eliminar el salto de línea si está presente
    mov x2, #0                      // Índice para encontrar el final de la cadena
find_length:
    ldrb w3, [x1, x2]               // Cargar el siguiente byte en la cadena
    cmp w3, #10                     // Comparar con el carácter de nueva línea '\n'
    beq found_newline               // Si es una nueva línea, reemplazarla con un terminador nulo
    cbz w3, copy_in_reverse         // Si es un terminador nulo, terminar la búsqueda
    add x2, x2, #1                  // Incrementar el índice
    b find_length                   // Repetir para el siguiente carácter

found_newline:
    strb wzr, [x1, x2]              // Reemplazar nueva línea con terminador nulo

copy_in_reverse:
    // Copiar la cadena al segundo buffer en orden inverso
    sub x2, x2, #1                  // Ajustar índice para el último carácter de la cadena
    ldr x4, =invertedBuffer         // Dirección del segundo buffer para la cadena invertida
    mov x3, #0                      // Índice para el buffer invertido
copy_loop:
    cmp x2, #0                      // Verificar si se han copiado todos los caracteres
    blt display_result              // Si x2 es negativo, ya terminamos de copiar
    ldrb w5, [x1, x2]               // Leer el carácter desde el final de la cadena original
    strb w5, [x4, x3]               // Escribir el carácter en el inicio del buffer invertido
    add x3, x3, #1                  // Incrementar índice en el buffer invertido
    sub x2, x2, #1                  // Decrementar índice en el buffer original
    b copy_loop                     // Repetir el bucle

display_result:
    // Mostrar el mensaje "Cadena invertida: "
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =resultMsg              // Dirección del mensaje "Cadena invertida: "
    mov x2, #17                     // Longitud del mensaje
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    // Mostrar la cadena invertida
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =invertedBuffer         // Dirección de la cadena invertida en el buffer
    mov x2, x3                      // Longitud de la cadena invertida (almacenada en x3)
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    // Imprimir una nueva línea
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =newline                // Dirección del carácter de nueva línea
    mov x2, #1                      // Longitud de un carácter
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    // Terminar el programa
    mov x8, #93                     // Syscall para 'exit' (93)
    svc #0                          // Ejecutar syscall
