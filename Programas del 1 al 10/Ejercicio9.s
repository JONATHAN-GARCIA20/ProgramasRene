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

// Programa en C#

using System;

class Program
{
    static void Main()
    {
        while (true)
        {
            try
            {
                // Solicitar el número al usuario
                Console.Write("Ingrese un numero para verificar si es primo: ");
                int n = Convert.ToInt32(Console.ReadLine());

                // Verificar si el número es primo
                if (IsPrime(n))
                {
                    Console.WriteLine("El numero es primo.\n");
                }
                else
                {
                    Console.WriteLine("El numero no es primo.\n");
                }
            }
            catch (FormatException)
            {
                Console.WriteLine("Error: Entrada no válida, por favor ingrese un número entero.\n");
            }
        }
    }

    // Función para verificar si un número es primo
    static bool IsPrime(int n)
    {
        // Números menores o iguales a 1 no son primos
        if (n <= 1) return false;

        // Verificar divisibilidad desde 2 hasta la raíz cuadrada de n
        for (int i = 2; i * i <= n; i++)
        {
            if (n % i == 0)
            {
                return false;
            }
        }

        // Si no se encuentra ningún divisor, el número es primo
        return true;
    }
}

*/
// Programa en ARM64 Assembly para RaspbianOS que verifica si un número es primo
// Este programa pedirá al usuario un número N y mostrará si es primo o no, luego vuelve a preguntar.

.data
    prompt:       .asciz "Ingrese un numero para verificar si es primo: " // Mensaje para solicitar el número
    primeMsg:     .asciz "El numero es primo.\n\n"                        // Mensaje cuando el número es primo (con dos saltos de línea)
    notPrimeMsg:  .asciz "El numero no es primo.\n\n"                     // Mensaje cuando el número no es primo (con dos saltos de línea)
    newline:      .asciz "\n"                                             // Nueva línea
    buffer:       .space 100                                              // Espacio para leer la entrada del usuario

.text
    .global _start

_start:
loop_start:
    // Mostrar el mensaje para solicitar el número
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =prompt                 // Dirección del mensaje "Ingrese un numero para verificar si es primo: "
    mov x2, #45                     // Longitud del mensaje
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    // Leer el número
    mov x0, #0                      // Descriptor de archivo para STDIN
    ldr x1, =buffer                 // Dirección del buffer para almacenar la entrada del usuario
    mov x2, #100                    // Longitud máxima a leer
    mov x8, #63                     // Syscall para 'read' (63)
    svc #0                          // Ejecutar syscall

    // Convertir la entrada (en ASCII) a un número entero
    ldr w1, =buffer                 // Dirección del buffer
    bl atoi                         // Llamar a la función atoi para conversión
    mov w4, w0                      // Almacenar el número en w4

    // Verificar si el número es menor o igual a 1
    cmp w4, #1
    ble not_prime                   // Si el número es <= 1, no es primo

    // Inicializar valores para verificar si el número es primo
    mov w5, #2                      // Iniciar divisor en 2
    mov w6, w4                      // w6 almacena el número ingresado (N)

check_divisors:
    // Calcular N % divisor
    udiv w7, w6, w5                 // w7 = N / divisor
    msub w8, w7, w5, w6             // w8 = N - (w7 * divisor) (esto es N % divisor)
    cbz w8, not_prime               // Si N % divisor == 0, no es primo

    // Incrementar divisor y verificar si divisor * divisor > N
    add w5, w5, #1                  // Incrementar divisor
    mul w8, w5, w5                  // Calcular divisor * divisor
    cmp w8, w6                      // Comparar divisor * divisor con N
    ble check_divisors              // Si divisor * divisor <= N, continuar el bucle

    // Si se completó el bucle sin encontrar divisores, el número es primo
prime:
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =primeMsg               // Dirección del mensaje "El numero es primo.\n\n"
    mov x2, #21                     // Longitud del mensaje con dos saltos de línea
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall
    b loop_start                    // Volver al inicio para preguntar de nuevo

not_prime:
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =notPrimeMsg            // Dirección del mensaje "El numero no es primo.\n\n"
    mov x2, #25                     // Longitud del mensaje con dos saltos de línea
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall
    b loop_start                    // Volver al inicio para preguntar de nuevo

// Función atoi: convierte una cadena ASCII a un entero
// Entrada: w1 = dirección de la cadena
// Salida: w0 = número entero
atoi:
    mov w0, #0                      // Inicializar el resultado a 0
    mov w9, #10                     // Valor 10 en w9 para las multiplicaciones
atoi_loop:
    ldrb w2, [x1], #1               // Cargar el siguiente carácter de la cadena
    sub w2, w2, '0'                 // Convertir carácter ASCII a valor numérico
    cmp w2, #9                      // Si es mayor que 9, fin de cadena
    bhi atoi_done
    mul w0, w0, w9                  // Multiplicar el resultado por 10 usando el registro w9
    add w0, w0, w2                  // Agregar el dígito al resultado
    b atoi_loop                     // Repetir para el siguiente carácter
atoi_done:
    ret                             // Retornar con el resultado en w0
