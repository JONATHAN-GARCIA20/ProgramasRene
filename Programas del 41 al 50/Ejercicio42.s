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
        Console.Write("Ingrese un número hexadecimal (sin 0x): ");
        string hexString = Console.ReadLine();

        try
        {
            int decimalValue = HexToDecimal(hexString);
            Console.WriteLine("El número en decimal es: " + decimalValue);
        }
        catch (FormatException)
        {
            Console.WriteLine("Entrada no válida. Asegúrese de ingresar un número hexadecimal válido.");
        }
    }

    static int HexToDecimal(string hexString)
    {
        // Convertir el número hexadecimal a decimal usando el método integrado
        return Convert.ToInt32(hexString, 16);
    }
}

*/

// Ejercicio42.s: Convierte una cadena hexadecimal a decimal en ARM64

.section .text
.global hex_to_decimal

// Función hex_to_decimal
// Entradas:
//   x0 = dirección de la cadena hexadecimal
// Salida:
//   w0 = número decimal resultante
hex_to_decimal:
    mov w1, 0               // Inicializar el acumulador (resultado) en w1
    mov x2, x0              // Copiar el puntero de la cadena en x2 para trabajar

convert_loop:
    ldrb w3, [x2], 1        // Cargar el siguiente byte de la cadena (un carácter)
    cmp w3, 0               // Comprobar si es el final de la cadena (carácter nulo)
    beq end_conversion      // Si es el final, terminar la conversión

    // Convertir el carácter de hexadecimal a valor decimal
    cmp w3, '0'
    b.lt invalid_character  // Si es menor que '0', es inválido
    cmp w3, '9'
    ble valid_digit         // Si está entre '0' y '9', es un dígito válido

    cmp w3, 'A'
    b.lt invalid_character  // Si es menor que 'A', es inválido
    cmp w3, 'F'
    ble valid_letter        // Si está entre 'A' y 'F', es una letra válida

invalid_character:
    mov w0, -1              // Devolver -1 si se encuentra un carácter no válido
    ret

valid_digit:
    sub w3, w3, '0'         // Convertir '0'-'9' a 0-9
    b apply_digit

valid_letter:
    sub w3, w3, 'A'         // Convertir 'A'-'F' a 10-15
    add w3, w3, 10

apply_digit:
    lsl w1, w1, 4           // Multiplicar el acumulador por 16 (desplazamiento a la izquierda de 4 bits)
    add w1, w1, w3          // Sumar el valor convertido al acumulador
    b convert_loop          // Repetir el bucle para el siguiente carácter

end_conversion:
    mov w0, w1              // Mover el resultado al registro de salida
    ret                      // Retornar
