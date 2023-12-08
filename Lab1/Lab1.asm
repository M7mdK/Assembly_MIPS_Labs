.data
#EX1
a: .word 7
b: .word 2
q: .asciiz "The quatient is "
r: .asciiz "\n The remainder is "

ln: .asciiz "\n"

#EX2
x: .word 4
y: .word 6
xs: .asciiz "\nThe value of x is: "
ys: .asciiz "The value of y is: "

.text
#EX1
lw $t0 a
lw $t1 b
div $t0 $t1

li $v0 4
la $a0 q
syscall

li $v0 1
mflo $a0
syscall

li $v0 4
la $a0 r
syscall

 li $v0 1
 mfhi $a0
 syscall 




#EX2
li $v0 4
la $a0 ln
syscall
li $v0 4
la $a0 ln
syscall

lw $t0 y
lw $t1 x
add $t0 $t0 $t1
sw $t0 y		#sw bt3ml copy lal value lmawjod bel $t0 wbt7oto bel y (JUST A COPY , NOT MOVING)
			#7ata move $a0 $t0 bt3ml copy mesh move
div $t1 $t0 2
sw $t1 x

#print x and y for varification:
li $v0 4
la $a0 ys
syscall

li $v0 1
lw $a0 y
syscall

li $v0 4
la $a0 xs
syscall

li $v0 1
lw $a0 x
syscall
