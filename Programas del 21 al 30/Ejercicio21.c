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

*/

// Declaración de la función en ensamblador
extern void transpos
#include <stdio.h>

// Declaración de la función en ensamblador
extern void transpose_matrix(int *matrix, int *transposed_matrix, int size);

int main() {
    int matrix[3][3];
    int transposed_matrix[3][3];
    int size = 3;

    // Solicitar al usuario que ingrese los elementos de la matriz
    printf("Ingrese los elementos de una matriz 3x3:\n");
    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            printf("Elemento [%d][%d]: ", i, j);
            scanf("%d", &matrix[i][j]);
        }
    }

    // Llamar a la función en ensamblador para transponer la matriz
    transpose_matrix((int *)matrix, (int *)transposed_matrix, size);

    // Imprimir la matriz transpuesta
    printf("Matriz transpuesta:\n");
    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            printf("%d ", transposed_matrix[i][j]);
        }
        printf("\n");
    }

    return 0;
}
