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
https://asciinema.org/a/0fCjX4IqoX4LnuffIwpQiWEGV

// Programa en C#

using System;

class Program
{
    static void Main()
    {
        // Define the array and length
        int[] array = { 3, 5, 7, 9 };
        int arrayLen = array.Length;

        // Display the array elements
        Console.WriteLine("Array: " + string.Join(", ", array));

        // Prompt the user to enter a number
        Console.Write("\nEnter the number to search: ");

        // Read and parse the user input
        if (int.TryParse(Console.ReadLine(), out int userInput))
        {
            // Perform linear search
            int result = LinearSearch(array, arrayLen, userInput);

            // Check if the element was found or not
            if (result != -1)
            {
                Console.WriteLine("\nElement found\n");
            }
            else
            {
                Console.WriteLine("\nElement not found\n");
            }
        }
        else
        {
            Console.WriteLine("\nInvalid input. Please enter a valid integer.\n");
        }
    }

    // Linear search function to find the index of the target element
    static int LinearSearch(int[] array, int arrayLen, int target)
    {
        for (int i = 0; i < arrayLen; i++)
        {
            if (array[i] == target)
            {
                return i;  // Return the index if found
            }
        }
        return -1;  // Return -1 if not found
    }
}

*/
.section .data
array:      .word 3, 5, 7, 9                      // Arreglo reducido a los elementos 3, 5, 7, 9
array_len:  .word 4                               // Longitud del arreglo
msg_array:  .asciz "\nArreglo: 3, 5, 7, 9\n"      // Mensaje con los elementos del arreglo
msg_prompt: .asciz "\nIngresa el numero a buscar: " // Mensaje de solicitud de entrada con salto de línea
msg_found:  .asciz "\nElemento encontrado\n\n"       // Mensaje si encuentra el elemento, con salto de línea extra al final
msg_not_found: .asciz "\nElemento no encontrado\n\n" // Mensaje si no encuentra el elemento, con salto de línea extra al final
buffer:     .space 10                              // Espacio para leer la entrada del usuario (suficiente para varios dígitos)

.section .text
.global _start

_start:
    // Mostrar el contenido del arreglo
    MOV x0, #1                   // File descriptor 1 (stdout)
    LDR x1, =msg_array           // Mensaje con los elementos del arreglo
    MOV x2, #20                  // Longitud del mensaje
    MOV x8, #64                  // Syscall número para write
    SVC #0                       // Llama al sistema para imprimir el mensaje

    // Solicitar al usuario el número a buscar
    MOV x0, #1                   // File descriptor 1 (stdout)
    LDR x1, =msg_prompt          // Mensaje de solicitud de entrada
    MOV x2, #27                  // Longitud del mensaje
    MOV x8, #64                  // Syscall número para write
    SVC #0                       // Llama al sistema para imprimir el mensaje

    // Leer el número ingresado por el usuario
    MOV x0, #0                   // File descriptor 0 (stdin)
    LDR x1, =buffer              // Dirección del buffer para almacenar la entrada del usuario
    MOV x2, #10                  // Longitud máxima de lectura (permitiendo múltiples dígitos)
    MOV x8, #63                  // Syscall número para read
    SVC #0                       // Llama al sistema para leer la entrada del usuario

    // Convertir la entrada en buffer a un número entero
    MOV w3, #0                   // Inicializar w3 (donde almacenaremos el número resultante) a 0
    MOV x4, #0                   // Índice para recorrer el buffer
    MOV w6, #10                  // Multiplicador 10 para la conversión

convert_to_int:
    LDRB w5, [x1, x4]            // Leer el siguiente byte del buffer usando x4 como índice
    CMP w5, #10                  // Comprobar si es un salto de línea (fin de la entrada)
    BEQ end_convert              // Si es un salto de línea, termina la conversión
    SUB w5, w5, #'0'             // Convertir el carácter ASCII a valor numérico
    MUL w3, w3, w6               // Multiplicar el número acumulado por 10 (usando w6)
    ADD w3, w3, w5               // Añadir el dígito actual al número acumulado
    ADD x4, x4, #1               // Incrementar el índice
    B convert_to_int             // Repetir el proceso para el siguiente carácter

end_convert:
    // Configuración inicial para la búsqueda
    LDR x1, =array               // x1 = dirección del arreglo
    LDR x2, =array_len           // x2 = dirección de array_len
    LDR w2, [x2]                 // Cargar el valor de array_len en w2

    // Llamada a la función de búsqueda lineal
    BL linear_search

    // Verificar el resultado de la búsqueda
    CMP w0, #-1
    BEQ print_not_found          // Si el resultado es -1, no se encontró

print_found:
    // Imprimir mensaje de éxito
    MOV x0, #1                   // File descriptor 1 (stdout)
    LDR x1, =msg_found           // Mensaje de éxito con salto de línea extra
    MOV x2, #22                  // Longitud del mensaje
    MOV x8, #64                  // Syscall número para write
    SVC #0                       // Llama al sistema para imprimir el mensaje
    B exit                       // Salir del programa

print_not_found:
    MOV x0, #1                   // File descriptor 1 (stdout)
    LDR x1, =msg_not_found       // Mensaje de fracaso con salto de línea extra
    MOV x2, #28                  // Longitud del mensaje
    MOV x8, #64                  // Syscall número para write
    SVC #0                       // Llama al sistema para imprimir el mensaje

exit:
    MOV x8, #93                  // Syscall número para salir (exit en Linux)
    SVC #0

// Función linear_search: Busca un número en un arreglo y devuelve la posición o -1.
linear_search:
    MOV w4, #0                   // Inicializa el índice i = 0

loop:
    CMP w4, w2                   // Compara i con la longitud del arreglo
    BGE not_found                // Si i >= n, no se encontró el valor

    LDR w5, [x1, x4, LSL #2]     // Lee array[i] (4 bytes cada elemento), usando x4 como desplazamiento
    CMP w5, w3                   // Compara array[i] con el valor buscado
    BEQ found                    // Si son iguales, encontró el valor

    ADD w4, w4, #1               // Incrementa el índice i
    B loop                       // Repite el ciclo

not_found:
    MOV w0, #-1                  // Retorna -1 si no se encontró el valor
    BR LR                        // Usar BR LR en lugar de RET

found:
    MOV w0, w4                   // Retorna la posición donde se encontró el valor
    BR LR                        // Usar BR LR en lugar de RET
