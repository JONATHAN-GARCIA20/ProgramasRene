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

// Programa en C#

*/

#include <stdio.h>

// Declaración de la función en ensamblador
extern void decimal_to_hex(int decimal, char *hex_buffer);

int main() {
    int decimal;
    char hex_buffer[9];  // Buffer para almacenar el número hexadecimal (8 dígitos + nulo)

    // Inicializar el buffer con ceros
    for (int i = 0; i < 9; i++) {
        hex_buffer[i] = '\0';
    }

    // Solicitar al usuario el número decimal
    printf("Ingrese un número decimal: ");
    scanf("%d", &decimal);

    // Llamar a la función en ensamblador para convertir a hexadecimal
    decimal_to_hex(decimal, hex_buffer);

    // Mostrar el resultado
    printf("El número en hexadecimal es: FF %s\n", hex_buffer);

    return 0;
}
