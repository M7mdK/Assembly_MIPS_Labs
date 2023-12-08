.data

F: .space 100
L: .space 100
S: .space 200
ef: .asciiz "Enter your first name:  "
el: .asciiz "Enter your last name:  "
n: .asciiz "\n"
.text
li $v0 4
la $a0 ef
syscall

li $v0 8 
la $a0 F
li $a1 100
syscall

li $v0 4
la $a0 el
syscall

li $v0 8
la $a0 L
li $a1 100
syscall

li $t0 0
loop:
lb $t1 F($t0)
beq $t1 '\0' end
sb $t1 S($t0)
addi $t0 $t0 1
j loop
end:

subi $t0 $t0 1	#bade ma7i \n lbten7at b2e5er l string badal \0 hod...w7ot ma7ala space
li $t9 ' '
sb $t9 S($t0)
addi $t0 $t0 1

li $t2 0
Loop:
lb $t3 L($t2)
beq $t3 '\0' End
sb $t3 S($t0)
addi $t0 $t0 1
addi $t2 $t2 1
j Loop
End:

li $v0 4
la $a0 n
syscall

li $v0 4
la $a0 S
syscall
