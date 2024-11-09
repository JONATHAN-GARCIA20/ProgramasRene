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
        const int MAX_STRINGS = 10;

        Console.Write($"Ingrese el número de cadenas (máximo {MAX_STRINGS}): ");
        if (!int.TryParse(Console.ReadLine(), out int n) || n < 2 || n > MAX_STRINGS)
        {
            Console.WriteLine("Debe ingresar al menos dos cadenas para comparar y no más de diez.");
            return;
        }

        string[] strings = new string[n];

        // Leer las cadenas
        for (int i = 0; i < n; i++)
        {
            Console.Write($"Ingrese la cadena {i + 1}: ");
            strings[i] = Console.ReadLine();
        }

        // Encontrar el prefijo común más largo
        string prefix = LongestCommonPrefix(strings);

        // Mostrar el resultado
        if (prefix.Length > 0)
        {
            Console.WriteLine($"El prefijo común más largo es: {prefix}");
        }
        else
        {
            Console.WriteLine("No hay un prefijo común.");
        }
    }

    static string LongestCommonPrefix(string[] strings)
    {
        if (strings.Length == 0) return "";

        // Inicializar el prefijo con la primera cadena
        string prefix = strings[0];

        for (int i = 1; i < strings.Length; i++)
        {
            int j = 0;

            // Comparar carácter por carácter hasta que no coincidan
            while (j < prefix.Length && j < strings[i].Length && prefix[j] == strings[i][j])
            {
                j++;
            }

            // Reducir el prefijo hasta la posición coincidente más larga
            prefix = prefix.Substring(0, j);

            // Si en algún momento el prefijo se vuelve vacío, no hay prefijo común
            if (prefix == "")
            {
                return "";
            }
        }

        return prefix;
    }
}

*/

// Ejercicio46.s: Encontrar el prefijo común más largo en ARM64

.section .text
.global longest_common_prefix

// Función longest_common_prefix
// Entradas:
//   x0 = puntero al arreglo de punteros a cadenas
//   x1 = número de cadenas
//   x2 = puntero al buffer para almacenar el prefijo común
// Salida:
//   w0 = longitud del prefijo común encontrado
longest_common_prefix:
    cbz x1, end               // Si el número de cadenas es 0, retornar 0
    mov w3, 0                 // Inicializar el índice de prefijo (w3)

loop_chars:
    // Cargar el primer carácter de la primera cadena
    ldr x4, [x0]              // Cargar el puntero de la primera cadena en x4
    add x4, x4, w3, sxtw      // Avanzar al carácter actual de la primera cadena (sign extend)
    ldrb w5, [x4]             // Cargar el carácter en w5
    cbz w5, end_prefix        // Si es el fin de la cadena, ir al final del prefijo

    // Comenzar la comparación con las demás cadenas
    mov x6, x0                // Restablecer el puntero al arreglo de cadenas
    mov w7, 1                 // Índice de cadena (comenzar desde la segunda cadena)

compare_loop:
    cmp w7, w1                // Comparar índice de cadena con el número total
    b.ge store_char           // Si se han comparado todas las cadenas, guardar el carácter

    // Cargar el carácter correspondiente de la cadena actual
    ldr x8, [x6, x7, lsl #3]  // Cargar el puntero de la cadena x7 (usar lsl para multiplicar por 8)
    add x8, x8, w3, sxtw      // Mover el puntero al carácter actual de la cadena (sign extend)
    ldrb w9, [x8]             // Cargar el carácter en w9
    cmp w5, w9                // Comparar el carácter con el de la primera cadena
    b.ne end_prefix           // Si es diferente, terminar el prefijo
    add w7, w7, 1             // Incrementar el índice de cadena
    b compare_loop            // Repetir para la siguiente cadena

store_char:
    // Guardar el carácter en el buffer de prefijo
    strb w5, [x2, w3, sxtw]   // Almacenar el carácter actual en el buffer de prefijo (sign extend)
    add w3, w3, 1             // Incrementar la longitud del prefijo
    b loop_chars              // Repetir para el siguiente carácter

end_prefix:
    strb wzr, [x2, w3, sxtw]  // Agregar un carácter nulo al final del prefijo (sign extend)
    mov w0, w3                // Devolver la longitud del prefijo
    ret

end:
    mov w0, 0                 // Si no hay cadenas, retornar 0
    ret
