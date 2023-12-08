.data
ln: .asciiz " "
N: .asciiz "Enter N , then values:\n"
.text
j main

Create:
subi $sp $sp 4
sw $a0 ($sp)
mul $a0 $a0 4
li $v0 9
syscall
lw $a0 ($sp)
addi $sp $sp 4
jr $ra

Fill:
subi $sp $sp 4
sw $a1 ($sp)
li $t0 0
loop:
beq $t0 $a0 next
li $v0 5
syscall
sw $v0 ($a1)
addi $a1 $a1 4
addi $t0 $t0 1
j loop
next:
lw $a1 ($sp)
addi $sp $sp 4
jr $ra

Print:
subi $sp $sp 4
sw $a0 ($sp)
move $t1 $a0
move $a2 $a1
li $t0 0
loop2:
beq $t0 $t1 done
li $v0 1
lw $a0 ($a2)
syscall
li $v0 4
la $a0 ln
syscall
addi $a2 $a2 4
addi $t0 $t0 1
j loop2
done:
lw $a0 ($sp)
addi $sp $sp 4
jr $ra

Replace:
move $s1 $a1
li $t9 0
li $t0 0
loop3:
beq $t0 $a0 Next
lw $t1 ($s1)
beq $t1 $a2 yes
j cont
yes:
sw $t9 ($s1)
j Next
cont:
addi $t0 $t0 1
addi $s1 $s1 4
j loop3
Next:
jr $ra

main:
#a0 contains N
#a1 contains the array
#a2 contains replaced int

li $v0 4
la $a0 N
syscall
li $v0 5
syscall
move $a0 $v0

jal Create
move $a1 $v0
jal Fill
jal Print
li $a2 2
jal Replace
jal Print
