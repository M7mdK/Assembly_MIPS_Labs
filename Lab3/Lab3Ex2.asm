.data
A: .word 0 0 0 0 0 0 0 0 0 0
E: .asciiz " Enter a positive integer value less than 1023 \n"
R: .asciiz "Result in binary is: "
.text
DoWhile:
li $v0 4
la $a0 E
syscall
li $v0 5
syscall
bgt $v0 1023 DoWhile
blt $v0 0 DoWhile
move $t1 $v0

li $t0 0
loop:
beqz $t1 end
div $t1 $t1 2
mfhi $t2
sw $t2 A($t0)
addi $t0 $t0 4
j loop
end:

li $v0 4
la $a0 R
syscall

li $t0 36
Print:
blt $t0 0 done
li $v0 1
lw $a0 A($t0)
syscall
sub $t0 $t0 4
j Print
done:
