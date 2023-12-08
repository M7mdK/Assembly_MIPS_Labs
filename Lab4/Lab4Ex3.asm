.data
S: .space 10
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
sb $t2 S($t0)
addi $t0 $t0 1
j loop
end:

li $t9 '\0'
sb $t9 S($t0)

li $v0 4
la $a0 R
syscall

li $t0 9
li $v0 1
Print:
lb $a0 S($t0)
syscall
subi $t0 $t0 1
blt $t0 0 done
j Print
done:
