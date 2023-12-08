.data
E: .asciiz "Enter n \n"
F: .asciiz "Factorial is: "

.text
li $v0 4
la $a0 E
syscall

li $v0 5
syscall
move $t1 $v0   #n

li $t2 1   #F
li $t0 2   #i
Loop:
bgt $t0 $t1 End
mul $t2 $t2 $t0
addi $t0 $t0 1
j Loop
End:
li $v0 4
la $a0 F
syscall

li $v0 1
move $a0 $t2
syscall