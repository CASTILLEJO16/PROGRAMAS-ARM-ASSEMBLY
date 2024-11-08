
╔════════════════════════════════════════════════════════════════════╗
║                    TECNOLÓGICO NACIONAL DE MÉXICO                 ║
║                     INSTITUTO TECNOLÓGICO DE TIJUANA              ║
╠════════════════════════════════════════════════════════════════════╣
║                   Carrera: Ingeniería en Sistemas                 ║
║                   Nombre: Lennyn Alejandro Castillejo Robles      ║
║                   Matrícula: 22210880                             ║
║                   Materia: INTERFAZ DE USUARIO           				 ║
║                              											   ║				
╠════════════════════════════════════════════════════════════════════╣
║                           Septiembre 2024                         ║
╚════════════════════════════════════════════════════════════════════╝


.data
    prompt:       .asciz "El máximo en el arreglo:\n"
    maxMsg:       .asciz "El máximo valor en el arreglo es: "
    array:        .word 5, 3, 8, 1, 2    // Array de ejemplo
    length:       .word 5                  // Longitud del array
    space:        .asciz " "               // Espacio entre números
    newline:      .asciz "\n"              // Nueva línea

.text
    .global _start

_start:
    // Mostrar el mensaje de inicio
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =prompt                 // Dirección del mensaje de inicio
    mov x2, #22                     // Longitud del mensaje
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    // Mostrar el contenido del arreglo
    mov w10, #0                     // Índice para impresión

print_array:
    ldr x3, =array                  // Dirección base del array
    lsl w11, w10, #2                // Desplazamiento de w10 (w11 = w10 * 4 bytes)
    add x3, x3, x11, UXTW          // Dirección de array[w10] con extensión sin signo
    ldr w0, [x3]                    // Cargar el valor en w0

    // Convertir el número a texto (para impresión) llamando a la función print_num
    bl print_num

    // Imprimir un espacio después de cada número (excepto el último)
    add w10, w10, #1                // Incrementar índice
    ldr x1, =length                 // Dirección de la longitud
    ldr w1, [x1]                    // Leer la longitud original del array
    cmp w10, w1                     // Comparar índice con la longitud del array
    bge end_array                   // Si es el último número, no imprimas un espacio
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =space                  // Dirección del espacio
    mov x2, #1                      // Longitud del espacio
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall
    b print_array                   // Repetir si aún hay elementos

end_array:
    // Añadir una nueva línea después del arreglo
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =newline                // Dirección de la nueva línea
    mov x2, #1                      // Longitud de la nueva línea
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    // Cargar la longitud del array en w1
    ldr x1, =length
    ldr w1, [x1]

    // Configurar el índice y el valor inicial máximo
    mov w2, #0                      // Índice del array
    ldr x3, =array                  // Dirección base del array
    ldr w4, [x3]                    // Cargar el primer valor del array en w4 (inicialmente el máximo)

find_max:
    // Cargar el valor actual del array en w5
    lsl w6, w2, #2                  // Calcular desplazamiento de índice (w2 * 4 bytes)
    add x7, x3, x6, UXTW           // Dirección de array[w2] con extensión sin signo
    ldr w5, [x7]                    // Cargar array[w2] en w5

    // Comparar y actualizar el valor máximo
    cmp w5, w4                      // Comparar el valor actual con el máximo actual
    ble skip_update                 // Saltar si w5 <= w4
    mov w4, w5                      // Actualizar el máximo si w5 es mayor

skip_update:
    // Incrementar índice y verificar si se alcanzó el final del array
    add w2, w2, #1                  // Incrementar el índice
    cmp w2, w1                      // Comparar índice con la longitud del array
    blt find_max                    // Repetir mientras el índice sea menor que la longitud

    // Mostrar el mensaje del valor máximo encontrado
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =maxMsg                 // Dirección del mensaje "El máximo valor en el arreglo es: "
    mov x2, #30                     // Longitud del mensaje
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    // Imprimir el valor máximo
    mov w0, w4                      // Cargar el máximo valor en w0 para impresión
    bl print_num                    // Llamada a la función para imprimir el número

    // Imprimir una nueva línea
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =newline                // Dirección de la nueva línea
    mov x2, #1                      // Longitud de la nueva línea
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    // Terminar el programa
    mov x8, #93                     // Syscall para 'exit' (93)
    svc #0                          // Ejecutar syscall

print_num:
    // Convertir el número a su equivalente ASCII y luego imprimirlo
    add w0, w0, #48                 // Convertir el número a su equivalente ASCII ('0' = 48)
    mov x1, sp                      // Usar la pila para el buffer temporal
    strb w0, [x1, #-1]!            // Guardar el carácter en la pila

    mov x0, #1                      // Descriptor de archivo para STDOUT
    mov x2, #1                      // Longitud del número convertido
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    ret                             // Retornar de la función p12
