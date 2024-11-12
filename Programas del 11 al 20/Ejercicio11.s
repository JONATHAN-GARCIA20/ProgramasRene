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

// Video
https://asciinema.org/a/0fCjX4IqoX4LnuffIwpQiWEGV

// Programa en C#

using System;

class Program
{
    static void Main()
    {
        while (true)
        {
            Console.WriteLine("\nIngresa la cadena para ver si es palindromo: ");
            string input = Console.ReadLine();

            // Remove any newline characters and ensure we're handling the string properly
            input = input.Trim();

            if (IsPalindrome(input))
            {
                Console.WriteLine("La cadena es un palindromo.\n");
            }
            else
            {
                Console.WriteLine("La cadena no es un palindromo.\n");
            }
        }
    }

    static bool IsPalindrome(string text)
    {
        int left = 0;
        int right = text.Length - 1;

        while (left < right)
        {
            if (text[left] != text[right])
            {
                return false;
            }
            left++;
            right--;
        }

        return true;
    }
}


*/

// Programa en ARM64 Assembly para RaspbianOS que verifica si una cadena es un palíndromo
// Este programa pedirá al usuario una cadena y verificará si es un palíndromo, luego muestra el resultado.
// Después de cada verificación, vuelve a preguntar al usuario.

.data
    prompt:       .asciz "\nIngresa la cadena para ver si es palindromo:   \n " // Mensaje para solicitar la cadena, con salto de línea inicial
    palindromeMsg: .asciz "La cadena es un palindromo.\n"                        // Mensaje si es palíndromo
    notPalindromeMsg: .asciz "La cadena no es un palindromo.\n"                  // Mensaje si no es palíndromo
    buffer:       .space 100                                                     // Espacio para leer la entrada del usuario

.text
    .global _start

_start:
loop_start:
    // Mostrar el mensaje para solicitar la cadena
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =prompt                 // Dirección del mensaje "Ingrese una cadena para verificar si es palindromo: "
    mov x2, #49                     // Longitud del mensaje (incluye `:` y espacio final, con salto de línea)
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
    cbz w3, check_palindrome        // Si es un terminador nulo, terminar la búsqueda
    add x2, x2, #1                  // Incrementar el índice
    b find_length                   // Repetir para el siguiente carácter

found_newline:
    strb wzr, [x1, x2]              // Reemplazar nueva línea con terminador nulo
    sub x2, x2, #1                  // Ajustar índice final al último carácter real

check_palindrome:
    // Comparar los caracteres desde ambos extremos hacia el centro
    mov x3, #0                      // Índice inicial (inicio de la cadena)
check_loop:
    cmp x3, x2                      // Comparar índices de inicio y fin
    bge is_palindrome               // Si se cruzan o se encuentran, es un palíndromo

    // Comparar caracteres en los extremos
    ldrb w4, [x1, x3]               // Leer carácter desde el inicio
    ldrb w5, [x1, x2]               // Leer carácter desde el final
    cmp w4, w5                      // Comparar los dos caracteres
    bne not_palindrome              // Si no son iguales, no es palíndromo

    // Actualizar índices y continuar
    add x3, x3, #1                  // Incrementar índice inicial
    sub x2, x2, #1                  // Decrementar índice final
    b check_loop                    // Repetir el bucle

is_palindrome:
    // Mostrar el mensaje "La cadena es un palindromo."
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =palindromeMsg          // Dirección del mensaje "La cadena es un palindromo.\n"
    mov x2, #28                     // Longitud del mensaje
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall
    b loop_start                    // Volver a preguntar

not_palindrome:
    // Mostrar el mensaje "La cadena no es un palindromo."
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =notPalindromeMsg       // Dirección del mensaje "La cadena no es un palindromo.\n"
    mov x2, #31                     // Longitud del mensaje
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall
    b loop_start                    // Volver a preguntar
