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
        Console.Write("Ingresa un número para verificar si es un número de Armstrong: ");
        int num = int.Parse(Console.ReadLine());

        // Verificar si el número es de Armstrong
        if (EsArmstrong(num))
        {
            Console.WriteLine($"{num} es un número de Armstrong");
        }
        else
        {
            Console.WriteLine($"{num} no es un número de Armstrong");
        }
    }

    // Función para contar el número de dígitos de un número
    static int ContarDigitos(int num)
    {
        int digitos = 0;
        while (num != 0)
        {
            digitos++;
            num /= 10;
        }
        return digitos;
    }

    // Función para verificar si un número es de Armstrong
    static bool EsArmstrong(int num)
    {
        int digitos = ContarDigitos(num);
        int suma = 0;
        int temp = num;

        // Calcular la suma de los dígitos elevados a la potencia 'digitos'
        while (temp != 0)
        {
            int digito = temp % 10;
            suma += (int)Math.Pow(digito, digitos);
            temp /= 10;
        }

        // Verificar si la suma es igual al número original
        return suma == num;
    }
}

*/

#include <stdio.h>
#include <math.h>

// Función para contar el número de dígitos de un número
int contar_digitos(int num) {
    int digitos = 0;
    while (num != 0) {
        digitos++;
        num /= 10;
    }
    return digitos;
}

// Función para verificar si un número es de Armstrong
int es_armstrong(int num) {
    int digitos = contar_digitos(num);
    int suma = 0;
    int temp = num;

    // Calcular la suma de los dígitos elevados a la potencia 'digitos'
    while (temp != 0) {
        int digito = temp % 10;
        suma += pow(digito, digitos);
        temp /= 10;
    }

    // Verificar si la suma es igual al número original
    return suma == num;
}

int main() {
    int num;

    // Pedir al usuario que ingrese un número
    printf("Ingresa un número para verificar si es un número de Armstrong: ");
    scanf("%d", &num);

    // Verificar si el número es de Armstrong
    if (es_armstrong(num)) {
        printf("%d es un número de Armstrong\n", num);
    } else {
        printf("%d no es un número de Armstrong\n", num);
    }

    return 0;
}
