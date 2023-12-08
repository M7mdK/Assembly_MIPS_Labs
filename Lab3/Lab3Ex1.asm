.data
E: .asciiz "enter 2 positive integers \n"
R: .asciiz "Result of mult is: "

.text

Dowhile:
li $v0 4
la $a0 E
syscall

li $v0 5		#a
syscall
move $t1 $v0

li $v0 5		#b
syscall
move $t2 $v0

blt $t1 0 Dowhile
blt $t2 0 Dowhile


bgt $t1 $t2 cont		#a must be > b
move $t9 $t2
move $t2 $t1
move $t1 $t9
cont:


li $t3 0	#Sum
li $t0 0
Loop:			#add a, b times
beq $t0 $t2 next
add $t3 $t3 $t1
addi $t0 $t0 1
j Loop
next:

li $v0 4
la $a0 R
syscall

li $v0 1
move $a0 $t3
syscall

