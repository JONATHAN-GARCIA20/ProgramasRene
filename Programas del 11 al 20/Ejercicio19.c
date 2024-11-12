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
 
*/

#include <stdio.h>

// Declaramos la función de ensamblador
extern void suma_matrices();

// Declaramos las matrices como externas
extern int matrizA[3][3];
extern int matrizB[3][3];
extern int resultado[3][3];

int main() {
    // Llamamos a la función de ensamblador
    suma_matrices();

    // Imprimimos el resultado
    printf("Resultado de la suma de matrices:\n");
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            printf("%d ", resultado[i][j]);
        }
        printf("\n");
    }
    return 0;
}
