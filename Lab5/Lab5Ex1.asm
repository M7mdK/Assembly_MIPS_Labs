.data
M: .asciiz "Max is: "
.text
j main
Max:
bgt $a0 $a1 next
move $v0 $a1
j done
next:
move $v0 $a0
done:
jr $ra

main:
li $v0 5
syscall
move $a0 $v0
li $v0 5
syscall
move $a1 $v0

jal Max
move $t1 $v0

li $v0 5
syscall
move $a0 $v0
li $v0 5
syscall
move $a1 $v0

jal Max
move $a0 $v0
move $a1 $t1


jal Max 
move $t0 $v0
li $v0 4
la $a0 M
syscall
move $a0 $t0
li $v0 1
syscall