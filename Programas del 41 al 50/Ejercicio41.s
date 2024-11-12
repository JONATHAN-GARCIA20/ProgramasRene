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

// Programa en C#

using System;

class Program
{
    static void Main()
    {
        Console.Write("Ingrese un número decimal: ");
        if (int.TryParse(Console.ReadLine(), out int decimalValue))
        {
            string hexResult = DecimalToHex(decimalValue);
            Console.WriteLine("El número en hexadecimal es: " + hexResult);
        }
        else
        {
            Console.WriteLine("Entrada no válida. Por favor, ingrese un número entero.");
        }
    }

    static string DecimalToHex(int decimalValue)
    {
        // Si el número es cero, devolver "0"
        if (decimalValue == 0)
            return "0";

        char[] hexBuffer = new char[8];  // Buffer para almacenar hasta 8 caracteres hexadecimales
        int index = hexBuffer.Length - 1; // Empezar desde el final del buffer

        // Bucle para convertir cada parte del número a un dígito hexadecimal
        while (decimalValue != 0 && index >= 0)
        {
            int remainder = decimalValue & 0xF;  // Obtener los últimos 4 bits
            hexBuffer[index] = (char)((remainder < 10) ? remainder + '0' : remainder - 10 + 'A');
            decimalValue >>= 4;  // Desplazar el número 4 bits a la derecha
            index--;             // Mover hacia el siguiente dígito
        }

        // Construir y devolver el resultado sin ceros al principio
        return new string(hexBuffer, index + 1, hexBuffer.Length - index - 1);
    }
}

*/

// Ejercicio41.s: Convierte un número decimal a hexadecimal en ARM64

.section .text
.global decimal_to_hex

// Función decimal_to_hex
// Entradas:
//   w0 = número decimal a convertir
//   x1 = dirección del buffer de salida
// Salida:
//   El buffer en x1 contendrá la representación en hexadecimal del número en w0
decimal_to_hex:
    mov x2, 8                 // Máximo de 8 dígitos hexadecimales (para un número de 32 bits)
    mov x3, x0                // Copiar el número decimal a x3 para trabajar con él
    add x1, x1, 7             // Mover el puntero al final del buffer para almacenar en orden inverso

    // Si el número es 0, almacenar '0' directamente y terminar
    cbz x3, store_zero

convert_loop:
    and w4, w3, 0xF           // Extraer los últimos 4 bits (un dígito hexadecimal)
    cmp w4, 10                // Verificar si el dígito es mayor o igual a 10
    add w4, w4, '0'           // Convertir a carácter ASCII '0' - '9'
    b.lt store_digit          // Si el dígito es menor a 10, saltar al almacenamiento

    add w4, w4, 7             // Si es >= 10, ajustar para letras 'A' - 'F'

store_digit:
    strb w4, [x1], -1         // Almacenar el dígito en el buffer y mover el puntero hacia atrás
    lsr w3, w3, 4             // Desplazar el número 4 bits a la derecha
    subs x2, x2, 1            // Decrementar el contador de dígitos
    cbnz w3, convert_loop     // Continuar si aún hay bits significativos en x3

    add x1, x1, 1             // Mover el puntero al primer dígito significativo
    b finish_conversion       // Ir a finalizar la conversión

store_zero:
    mov w4, '0'               // Almacenar '0' si el número es cero
    strb w4, [x1], -1         // Guardar '0' en el buffer
    add x1, x1, 1             // Ajustar el puntero al primer dígito

finish_conversion:
    mov w4, 0                 // Carácter nulo para terminar la cadena
    strb w4, [x1]             // Escribir el carácter nulo al final de la cadena
    ret                       // Retornar
