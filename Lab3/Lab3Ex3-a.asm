.data
T: .word 1 2 3 4 5
P: .asciiz "Array in reverse order: "
.text

li $t0 0   #i
li $t1 16   #j
Loop:
beq $t0 8 end
lw $t2 T($t0)
lw $t3 T($t1)
sw $t2 T($t1)
sw $t3 T($t0)
addi $t0 $t0 4
subi $t1 $t1 4
j Loop
end:

li $v0 4
la $a0 P
syscall

li $t0 0
Print:
beq $t0 20 done
lw $a0 T($t0)
li $v0 1
syscall
addi $t0 $t0 4
j Print
done:
