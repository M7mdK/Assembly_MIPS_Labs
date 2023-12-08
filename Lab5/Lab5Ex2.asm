.data
S: .space 64
.text
j main
encrypt:
add $v0 $a0 $a1
jr $ra

main:
li $v0 8
la $a0 S
li $a1 64
syscall

li $a1 2

li $t0 0
loop:
lb $a0 S($t0)
beq $a0 '\0' next
jal encrypt
sb $v0 S($t0)
addi $t0 $t0 1
j loop
next:

li $v0 4
la $a0 S
syscall