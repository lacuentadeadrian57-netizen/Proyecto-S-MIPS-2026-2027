.data
numbers: .word 2, 2, -1, -3

.text
la $t0, numbers
lw $s0, 0($t0)
lw $s1, 4($t0)
lw $s2, 8($t0)
lw $s3, 12($t0)
# TEST
add $a0, $s0, $s1
jal imprimir_hex
add $a0, $s2, $s3
jal imprimir_hex
addu $a0, $s0, $s1
jal imprimir_hex
jal nueva_linea

sub $a0, $s0, $s1
jal imprimir_hex
sub $a0, $s2, $s3
jal imprimir_hex
and $a0, $s2, $s3
jal imprimir_hex
jal nueva_linea

or $a0, $s2, $s3
jal imprimir_hex
slt $a0, $s0, $s1
jal imprimir_hex
slt $a0, $s2, $s0
jal imprimir_hex
jal nueva_linea

sll $a0, $s0, 2
jal imprimir_hex
srl $a0, $s3, 2
jal imprimir_hex
addi $a0, $s0, -5
jal imprimir_hex
jal nueva_linea

addiu $a0, $s0, -5
jal imprimir_hex
slti $a0, $s0, 10
jal imprimir_hex
slti $a0, $s2, -5
jal imprimir_hex
jal nueva_linea

andi $a0, $s0, 0xf000
jal imprimir_hex
ori $a0, $s0, 0xf000
jal imprimir_hex
lui $a0, 0xffff
jal imprimir_hex
jal nueva_linea
# END OF PROGRAM
li $v0, 10 
syscall


# imprime $a0 en hexadecimal (8 digitos) seguido de un espacio
imprimir_hex:
        add  $t0, $a0, $zero
        addi $t1, $zero, 8
ih_bucle:
        srl  $t2, $t0, 28            # digito mas significativo
        slti $t3, $t2, 10
        beq  $t3, $zero, ih_letra
        addi $a0, $t2, 48            # '0' + d
        j    ih_imprime
ih_letra:
        addi $a0, $t2, 87            # 'a' + d - 10
ih_imprime:
        addi $v0, $zero, 11
        syscall
        sll  $t0, $t0, 4
        addi $t1, $t1, -1
        bne  $t1, $zero, ih_bucle
        addi $a0, $zero, 32          # espacio
        addi $v0, $zero, 11
        syscall
        jr   $ra

nueva_linea:
        addi $a0, $zero, 10
        addi $v0, $zero, 11
        syscall
        jr   $ra
