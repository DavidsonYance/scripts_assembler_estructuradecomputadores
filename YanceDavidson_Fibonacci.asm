# Script para calcular la serie de Fibonacci hasta el número indicado por el usuario
.data
    mensaje_fibo: .asciiz "Ingrese cuántos números de la serie Fibonacci desea generar: "
    mensaje_resultado: .asciiz "Serie Fibonacci: "
    mensaje_suma: .asciiz "\nSuma de la serie: "

.text
.globl main

main:
    # Pedir la cantidad de números a generar
    li $v0, 4
    la $a0, mensaje_fibo
    syscall
    
    li $v0, 5
    syscall
    move $t0, $v0  # Guardar cantidad de números

    # Mostrar mensaje de resultado
    li $v0, 4
    la $a0, mensaje_resultado
    syscall
    
    # Inicializar variables
    li $t1, 0  # Primer número Fibonacci
    li $t2, 1  # Segundo número Fibonacci
    li $t3, 0  # Contador
    li $t4, 0  # Suma de la serie

loop_fibo:
    beq $t3, $t0, fin_fibo
    
    # Imprimir número actual
    li $v0, 1
    move $a0, $t1
    syscall
    
    # Imprimir espacio
    li $v0, 11
    li $a0, 32
    syscall
    
    # Sumar al total
    add $t4, $t4, $t1
    
    # Calcular siguiente número
    add $t5, $t1, $t2
    move $t1, $t2
    move $t2, $t5
    
    addi $t3, $t3, 1
    j loop_fibo

fin_fibo:
    # Mostrar suma de la serie
    li $v0, 4
    la $a0, mensaje_suma
    syscall
    
    li $v0, 1
    move $a0, $t4
    syscall
    
    # Terminar programa
    li $v0, 10
    syscall
