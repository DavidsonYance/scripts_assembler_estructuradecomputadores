# Script para encontrar el número menor de una lista ingresada por el usuario
.data
    mensaje_pedir_menor: .asciiz "Ingrese la cantidad de números a comparar (mínimo 3, máximo 5): "
    mensaje_numero_menor: .asciiz "Ingrese un número: "
    mensaje_menor: .asciiz "El número menor es: "
    numeros_menor: .space 20

.text
.globl main

main:
    # Pedir la cantidad de números
    li $v0, 4
    la $a0, mensaje_pedir_menor
    syscall
    
    li $v0, 5
    syscall
    move $t0, $v0  # Guardar cantidad de números en $t0

    # Inicializar variables
    li $t1, 0  # Contador
    li $t2, 2147483647  # Máximo valor posible (para comparación)

loop_menor:
    beq $t1, $t0, fin_menor
    
    # Pedir número
    li $v0, 4
    la $a0, mensaje_numero_menor
    syscall
    
    li $v0, 5
    syscall
    move $t3, $v0
    
    # Comparar con el menor actual
    bge $t3, $t2, siguiente_menor
    move $t2, $t3  # Actualizar menor
    
siguiente_menor:
    addi $t1, $t1, 1
    j loop_menor

fin_menor:
    # Mostrar resultado
    li $v0, 4
    la $a0, mensaje_menor
    syscall
    
    li $v0, 1
    move $a0, $t2
    syscall
    
    # Terminar programa
    li $v0, 10
    syscall