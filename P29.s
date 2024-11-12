.section .text
.global count_set_bits

// Función count_set_bits
// Entrada: x0 = número
// Salida: w0 = cantidad de bits activados (en 1)
count_set_bits:
    mov w1, 0                 // Inicializar el contador de bits en 1 en w1

count_loop:
    cmp w0, 0                 // Comparar el número con 0
    beq end_count             // Si es 0, terminar el bucle

    and w2, w0, 1             // Verificar el bit menos significativo (AND con 1)
    add w1, w1, w2            // Si el bit está en 1, incrementar el contador

    lsr w0, w0, 1             // Desplazar el número a la derecha en 1 posición (descartar el bit menos significativo)
    b count_loop              // Repetir el bucle

end_count:
    mov w0, w1                // Mover el contador al registro w0 para el resultado
    ret                       // Retornar al llamador
