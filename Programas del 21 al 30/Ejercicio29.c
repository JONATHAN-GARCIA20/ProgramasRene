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
https://asciinema.org/a/1USV0VHC3rVz46Hpgwt2Buqwm

// Problema en C#

using System;

class Program
{
    // Function to convert a number to its binary representation as a string
    static string ToBinary(int num, int size)
    {
        char[] binaryStr = new char[size];
        for (int i = size - 1; i >= 0; i--)
        {
            binaryStr[i] = (num & 1) == 1 ? '1' : '0';
            num >>= 1;
        }

        // Remove leading zeros
        string binary = new string(binaryStr).TrimStart('0');
        return string.IsNullOrEmpty(binary) ? "0" : binary; // Handle case for zero
    }

    // Function to count the number of set bits in an integer
    static int CountSetBits(int num)
    {
        int count = 0;
        while (num != 0)
        {
            count += num & 1;
            num >>= 1;
        }
        return count;
    }

    static void Main()
    {
        // Prompt the user to enter a number
        Console.Write("Ingrese un número: ");
        if (!int.TryParse(Console.ReadLine(), out int num))
        {
            Console.WriteLine("Error: Entrada inválida.");
            return;
        }

        // Convert the number to binary and count the set bits
        string binaryStr = ToBinary(num, 32);
        int result = CountSetBits(num);

        // Print the binary representation and the number of set bits
        Console.WriteLine($"Representación en binario: {binaryStr}");
        Console.WriteLine($"Número de bits activados: {result}");
    }
}

*/

#include <stdio.h>

// Declaración de la función en ensamblador
extern int count_set_bits(int num);

// Función para convertir un número a su representación binaria en forma de cadena
void to_binary(int num, char *binary_str, int size) {
    int index = size - 1;
    binary_str[size] = '\0'; // Asegurarse de que la cadena esté terminada en NULL

    // Llenar la cadena binaria de derecha a izquierda
    for (int i = index; i >= 0; i--) {
        binary_str[i] = (num & 1) ? '1' : '0';
        num >>= 1;
    }

    // Eliminar ceros iniciales
    int start = 0;
    while (binary_str[start] == '0' && start < index) {
        start++;
    }

    // Desplazar la cadena para eliminar los ceros iniciales
    for (int i = 0; i <= index - start; i++) {
        binary_str[i] = binary_str[i + start];
    }
    binary_str[index - start + 1] = '\0'; // Terminar la cadena correctamente
}

int main() {
    int num;
    char binary_str[33]; // Cadena para almacenar la representación binaria (32 bits + terminador)

    // Solicitar al usuario que ingrese un número
    printf("Ingrese un número: ");
    scanf("%d", &num);

    // Convertir el número a binario y contar los bits activados
    to_binary(num, binary_str, 32); // Convertir el número a una cadena binaria de 32 bits
    int result = count_set_bits(num);

    // Imprimir el número en binario y el número de bits activados
    printf("Representación en binario: %s\n", binary_str);
    printf("Número de bits activados: %d\n", result);

    return 0;
}
