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
https://asciinema.org/a/dj85vW0pX5C2JM6dtd0KZqMlP

// Programa en C#

using System;

class Program
{
    static void Main()
    {
        // Solicitar el primer número al usuario
        Console.Write("Ingrese el primer numero: ");
        int firstNumber = Convert.ToInt32(Console.ReadLine());

        // Solicitar el segundo número al usuario
        Console.Write("Ingrese el segundo numero: ");
        int secondNumber = Convert.ToInt32(Console.ReadLine());

        // Realizar la resta
        int result = firstNumber - secondNumber;

        // Mostrar el resultado de la resta
        Console.WriteLine("Resultado de la resta: " + result);
    }
}

*/
// Programa en ARM64 Assembly para RaspbianOS que resta dos números
// Grabar esta corrida en asciinema.org, con tus generales de estudiante, seguido de la compilación, ejecución, depuración en GEF.
// Recuerda vincular tu asciinema a tu correo para evitar que se borre en 7 días.

.data
    prompt1:      .asciz "Ingrese el primer numero: "  // Mensaje para solicitar el primer número
    prompt2:      .asciz "Ingrese el segundo numero: " // Mensaje para solicitar el segundo número
    resultMsg:    .asciz "Resultado de la resta: "     // Mensaje para mostrar el resultado
    newline:      .asciz "\n"                          // Nueva línea
    buffer:       .space 100                           // Espacio para leer la entrada del usuario
    resultBuffer: .space 12                            // Espacio para almacenar el resultado

.text
    .global _start

_start:
    // Mostrar el mensaje para solicitar el primer número
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =prompt1                // Dirección del mensaje "Ingrese el primer numero"
    mov x2, #26                     // Longitud del mensaje
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    // Leer el primer número
    mov x0, #0                      // Descriptor de archivo para STDIN
    ldr x1, =buffer                 // Dirección del buffer para almacenar la entrada del usuario
    mov x2, #100                    // Longitud máxima a leer
    mov x8, #63                     // Syscall para 'read' (63)
    svc #0                          // Ejecutar syscall

    // Convertir la entrada (en ASCII) a un número entero
    ldr w1, =buffer                 // Dirección del buffer
    bl atoi                         // Llamar a la función atoi para conversión
    mov w4, w0                      // Almacenar el primer número en w4

    // Mostrar el mensaje para solicitar el segundo número
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =prompt2                // Dirección del mensaje "Ingrese el segundo numero"
    mov x2, #27                     // Longitud del mensaje
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    // Leer el segundo número
    mov x0, #0                      // Descriptor de archivo para STDIN
    ldr x1, =buffer                 // Dirección del buffer para almacenar la entrada del usuario
    mov x2, #100                    // Longitud máxima a leer
    mov x8, #63                     // Syscall para 'read' (63)
    svc #0                          // Ejecutar syscall

    // Convertir la entrada (en ASCII) a un número entero
    ldr w1, =buffer                 // Dirección del buffer
    bl atoi                         // Llamar a la función atoi para conversión
    mov w5, w0                      // Almacenar el segundo número en w5

    // Realizar la resta (primer número - segundo número)
    sub w6, w4, w5                  // Resta w4 - w5 y almacena el resultado en w6

    // Mostrar mensaje "Resultado de la resta: "
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =resultMsg              // Dirección del mensaje "Resultado de la resta"
    mov x2, #22                     // Longitud del mensaje
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    // Convertir el resultado de la resta a ASCII y almacenarlo en el buffer
    mov w0, w6                      // Mover el resultado de la resta a w0
    ldr x1, =resultBuffer           // Dirección del buffer para el resultado
    bl itoa                         // Llamar a la función para convertir el número a ASCII

    // Mostrar el contenido del buffer con el resultado de la resta
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =resultBuffer           // Dirección del buffer que contiene el resultado
    mov x2, #12                     // Longitud máxima del buffer de resultado
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    // Imprimir una nueva línea para separar el resultado del prompt de la shell
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =newline                // Dirección del carácter de nueva línea
    mov x2, #1                      // Longitud de un carácter
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    // Terminar el programa
    mov x8, #93                     // Syscall para 'exit' (93)
    svc #0                          // Ejecutar syscall

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

// Función itoa: convierte un entero a una cadena ASCII
// Entrada: w0 = número entero
// Salida: x1 = dirección de la cadena donde se almacena el resultado
itoa:
    mov x2, x1                      // Copiar la dirección del buffer al registro de trabajo
    add x2, x2, #11                 // Mover el puntero al final del espacio reservado
    mov w9, #10                     // Valor 10 en w9 para las divisiones
itoa_loop:
    udiv w3, w0, w9                 // Dividir el número por 10 usando w9
    msub w4, w3, w9, w0             // Obtener el dígito restante
    add w4, w4, '0'                 // Convertir el dígito a ASCII
    sub x2, x2, #1                  // Retroceder el puntero
    strb w4, [x2]                   // Almacenar el dígito en la cadena
    mov w0, w3                      // Continuar con el cociente
    cbnz w0, itoa_loop              // Repetir mientras haya dígitos
    mov x0, x2                      // Retornar la dirección del inicio de la cadena en x0
    ret                             // Retornar
