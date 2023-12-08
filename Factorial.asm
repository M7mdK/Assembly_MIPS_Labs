.data
E: .asciiz "enter value for N: \n"
F: .asciiz "factorial is: \n"
.text
j main

fact:
li $v0 1
move $t0 $a0
comp:
beqz $t0 next
subi $sp $sp 4
sw $ra ($sp)
subi $sp $sp 4
sw $t0 ($sp)
subi $t0 $t0 1
jal comp
next:
lw $t1 ($sp)
addi $sp $sp 4
lw $ra ($sp)
addi $sp $sp 4
mul $v0 $v0 $t1
jr $ra

main:
li $v0 4
la $a0 E
syscall
li $v0 5
syscall
move $a0 $v0 #N
jal fact
move $t1 $v0
li $v0 4
la $a0 F
syscall
li $v0 1
move $a0 $t1
syscall