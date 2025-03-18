# Script para encontrar el número mayor de una lista ingresada por el usuario
.data
    mensaje_pedir: .asciiz "Ingrese la cantidad de números a comparar (mínimo 3, máximo 5): "
    mensaje_numero: .asciiz "Ingrese un número: "
    mensaje_mayor: .asciiz "El número mayor es: "
    numeros: .space 20

.text
.globl main

main:
    # Pedir la cantidad de números
    li $v0, 4
    la $a0, mensaje_pedir
    syscall
    
    li $v0, 5
    syscall
    move $t0, $v0  # Guardar cantidad de números en $t0

    # Inicializar variables
    li $t1, 0  # Contador
    li $t2, -2147483648  # Mínimo valor posible (para comparación)

loop_mayor:
    beq $t1, $t0, fin_mayor
    
    # Pedir número
    li $v0, 4
    la $a0, mensaje_numero
    syscall
    
    li $v0, 5
    syscall
    move $t3, $v0
    
    # Comparar con el mayor actual
    ble $t3, $t2, siguiente_mayor
    move $t2, $t3  # Actualizar mayor
    
siguiente_mayor:
    addi $t1, $t1, 1
    j loop_mayor

fin_mayor:
    # Mostrar resultado
    li $v0, 4
    la $a0, mensaje_mayor
    syscall
    
    li $v0, 1
    move $a0, $t2
    syscall
    
    # Terminar programa
    li $v0, 10
    syscall