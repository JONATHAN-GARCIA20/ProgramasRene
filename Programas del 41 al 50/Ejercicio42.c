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

//Programa en C#

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

#include <stdio.h>
#include <string.h>

// Declaración de la función en ensamblador
extern int hex_to_decimal(const char *hex_string);

int main() {
    char hex_string[9];  // Buffer para almacenar la entrada hexadecimal (hasta 8 dígitos)

    // Solicitar al usuario el número hexadecimal
    printf("Ingrese un número hexadecimal (sin 0x): ");
    scanf("%8s", hex_string);  // Leer hasta 8 caracteres para evitar desbordamiento

    // Llamar a la función en ensamblador para convertir a decimal
    int decimal = hex_to_decimal(hex_string);

    // Mostrar el resultado
    printf("El número en decimal es: %d\n", decimal);

    return 0;
}
