.data
S: .space 20	#howi lmafrood eza bade 20 included 7ota 21
.text
li $v0 8
la $a0 S
li $a1 20
syscall

li $t0 0
li $t2 '#'
loop:
lb $t1 S($t0)
beq $t1 '\0' done
beq $t1 'a' vowel
beq $t1 'e' vowel
beq $t1 'i' vowel
beq $t1 'u' vowel
beq $t1 'o' vowel
j NotVowel
vowel:
sb $t2 S($t0)
NotVowel:
addi $t0 $t0 1
j loop
done:

li $v0 4
la $a0 S
syscall
