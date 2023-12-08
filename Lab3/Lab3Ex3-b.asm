.data
N: .asciiz "Enter a nonzero positive integer value less than or equal to 50 \n"
E: .asciiz "Enter values:\n"
p: .asciiz "Your Array before reversing: "
P: .asciiz "Your Array in reverse order: "
s: .asciiz "  "
n: .asciiz "\n"
.text
DoWhile:
li $v0 4
la $a0 N
syscall
li $v0 5
syscall
blt $v0 1 DoWhile
bgt $v0 50 DoWhile
move $t1 $v0   #N
mul $t1 $t1 4
li $v0 9
move $a0 $t1
syscall
move $s0 $v0  #Array address is in $s0
move $s1 $s0

li $v0 4
la $a0 E
syscall
li $t0 0
Scan:
beq $t0 $t1 end
li $v0 5
syscall
sw $v0 ($s1)
addi $s1 $s1 4
addi $t0 $t0 4
j Scan
end:

move $s2 $s0
li $v0 4	#Array
la $a0 p
syscall
li $t0 0
print:
beq $t0 $t1 done
li $v0 1
lw $a0 ($s2)
syscall
li $v0 4
la $a0 s
syscall
addi $t0 $t0 4
addi $s2 $s2 4
j print
done:

subi $s1 $s1 4
move $s2 $s0
div $t1 $t1 4
div $t2 $t1 2   #N/2
mul $t2 $t2 4
mul $t1 $t1 4
li $t0 0  #i
reverse:
beq $t0 $t2 End
lw $t4 ($s1)
lw $t5 ($s2)
sw $t4 ($s2)
sw $t5 ($s1)
addi $t0 $t0 4
addi $s2 $s2 4
subi $s1 $s1 4
j reverse
End:

li $v0 4
la $a0 n
syscall

li $v0 4	#reversed Array
la $a0 P
syscall
li $t0 0
Print:
beq $t0 $t1 Done
li $v0 1
lw $a0 ($s0)
syscall
li $v0 4
la $a0 s
syscall
addi $t0 $t0 4
addi $s0 $s0 4
j Print
Done:
