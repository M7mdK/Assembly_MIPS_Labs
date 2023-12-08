.data 
E: .asciiz "Enter 2 positive numbers of same number of digits \n"
sp: .asciiz "  and it is prime \n"
snp: .asciiz "  and it is NOT prime \n"
sum: .asciiz "sum of odd digits in both numbers is: "
.text
DoWhile:
li $v0 4
la $a0 E
syscall
li $v0 5
syscall
move $t1 $v0	#n1
li $v0 5
syscall
move $t2 $v0	#n2
blt $t1 0 DoWhile
blt $t2 0 DoWhile

move $s1 $t1
move $s2 $t2
digits:
div $s1 $s1 10
div $s2 $s2 10
beqz $s1 check1
beqz $s2 check2
j digits
check1:
bnez $s2 DoWhile
check2:
bnez $s1 DoWhile


li $t0 0 #sum
li $t9 2 #fixed
Sum:
div $t1 $t1 10
mfhi $t3 
div $t2 $t2 10
mfhi $t4
div $t3 $t9	#
mfhi $t5
div $t4 $t9
mfhi $t6
beqz $t5 NotOdd1	#
add $t0 $t0 $t3
NotOdd1:
beqz $t6 NotOdd2
add $t0 $t0 $t4
NotOdd2:
beqz $t1 end	#OR $t2=0 (same number of digits)
j Sum
end:

li $v0 4
la $a0 sum
syscall

li $v0 1
move $a0 $t0
syscall

li $s0 2
isPrime:
beq $s0 $t0 Prime
div $t0 $s0
mfhi $t7
beqz $t7 NotPrime
addi $s0 $s0 1
j isPrime
Prime:
li $v0 4
la $a0 sp
syscall

li $v0 10
syscall

NotPrime:
li $v0 4
la $a0 snp
syscall