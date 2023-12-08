.data
A: .asciiz "\n Enter a positive number \n"
P: .asciiz "Prime \n"
nP: .asciiz "Not prime \n"

.text
li $v0 4
la $a0 A
syscall

dowhile:
li $v0 5
syscall
blt $v0 0 dowhile
move $t1 $v0	#Entered positive number

li $t0 2	#i=2
loop:
beq $t0 $t1 end

div $t1 $t0
mfhi $t2
beq $t2 0 Break
addi $t0 $t0 1

j loop
Break:
la $a0 nP
j print

end:
la $a0 P
print:
li $v0 4
syscall