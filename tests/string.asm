.data
char: .ascii "S"
string: .ascii "HOLAAAAAATODOSSSSS"
n: .word 18
 
.text
la $at, char
lb $s0, 0($at)
la $s1, string
la $at, n
lw $t0, 0($at)
loop:
beq $t0, $zero, end
addi $t0, $t0, -1
add $at, $s1, $t0
lb $t1, 0($at)
bne $t1, $s0, loop
add $a0, $s0, $zero
addi $v0, $zero, 11
syscall
j loop
end:

add $zero, $zero, $s0
addi $a0, $zero,  0x41
addi $v0, $zero, 11
syscall

addi $v0, $zero, 10
syscall












