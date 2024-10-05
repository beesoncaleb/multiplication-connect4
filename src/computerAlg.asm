.data
	string1: .asciiz "Computer changes "
	string2: .asciiz " to "
	stringA: .asciiz "A"
	stringB: .asciiz "B"
	newline: .asciiz "\n"
	A: .byte 0
	B: .byte 0

.text
.globl computerAlg
computerAlg:
	sb $t8, A				# Saces $t8 into A
 	sb $t9, B				# Saves $t9 into B

	li $v0, 4   				
 	la $a0, string1				# Prints string1
 	syscall
 	
 	beq $t8, $zero,first			# Checks if first move
	beq $t9, $zero,first
	
	# Check if 5, 12, 21, or 32 has been played by player
	j validiationForComputer5_12_21_32
.globl valid5_12_21_32
valid5_12_21_32:
	# Check if 32 has been played
	j validiationForComputer32
.globl valid32
valid32:
	beq $t8, 8,B4				# Try to play 32
	beq $t9, 8,A4
	beq $t8, 4,B8
	beq $t9, 4,A8
.globl skip32
skip32:	
	j validiationForComputer12
.globl valid12
valid12:
	# Check if 12 has been played
	beq $t8, 3,B4				# Try to play 12
	beq $t9, 3,A4
	beq $t8, 4,B3
	beq $t9, 4,A3
	beq $t8, 2,B6
	beq $t9, 2,A6
	beq $t8, 6,B2
	beq $t9, 6,A2
.globl skip12
skip12:
	j validiationForComputer5
.globl valid5
valid5:
	# Check if 5 has been played
	beq $t8, 1,B5				# Try to play 5
	beq $t9, 1,A5
	beq $t8, 5,B1
	beq $t9, 5,A1	
.globl skip5
skip5:	
	j validiationForComputer21
.globl valid21
valid21:
	# Check if 21 has been played
	beq $t8, 7,B3				# Try to play 21
	beq $t9, 7,A3
	beq $t8, 3,B7
	beq $t9, 3,A7
.globl skip21
skip21:						 
	# Jump here if 5, 12, 21, or 32 was played by player
	j validiationForComputer9_20_49_32
.globl valid9_20_49_32
valid9_20_49_32:
	# Check if 32 has been played
	j validiationForComputer32.2
.globl valid32.2
valid32.2:
	beq $t8, 8,B4				# Try to play 32
	beq $t9, 8,A4
	beq $t8, 4,B8
	beq $t9, 4,A8
.globl skip32.2
skip32.2:
	# Check if 9, 20, 49, or 32 was played by player
	j validiationForComputer20
.globl valid20
valid20:
	# Check if 20 has been played
	beq $t8, 5,B4				# Try to play 20
	beq $t9, 5,A4
	beq $t8, 4,B5				
	beq $t9, 4,A5
.globl skip20
skip20:	
	j validiationForComputer49
.globl valid49
valid49:
	# Check if 49 has been played
	beq $t8, 7,B7				# Try to play 49
	beq $t9, 7,A7
.globl skip49
skip49:
	j validiationForComputer9
.globl valid9
valid9:
	# Check if 9 has been played
	beq $t8, 9,B1				# Try to play 9
	beq $t9, 9,A1
	beq $t8, 1,B9			
	beq $t9, 1,A9
.globl skip9
skip9:
	# Jump here if 9, 20, 49, or 32 was played by player
	j validiationForComputer72_16_45_28
.globl valid72_16_45_28
valid72_16_45_28:
	j validiationForComputer72
.globl valid72
valid72:
	# Check if 72 has been played
	beq $t8, 9,B8				# Try to play 72
	beq $t9, 9,A8
	beq $t8, 8,B9			
	beq $t9, 8,A9
.globl skip72
skip72:
	j validiationForComputer16
.globl valid16
valid16:
	# Check if 16 has been played
	beq $t8, 4,B4				# Try to play 16
	beq $t9, 4,A4
	beq $t8, 8,B2			
	beq $t9, 8,A2
	beq $t8, 2,B8			
	beq $t9, 2,A8
.globl skip16
skip16:
	j validiationForComputer45
.globl valid45
valid45:
	# Check if 45 has been played
	beq $t8, 9,B5				# Try to play 45
	beq $t9, 9,A5
	beq $t8, 5,B9			
	beq $t9, 5,A9
.globl skip45
skip45:
	j validiationForComputer28
.globl valid28
valid28:
	# Check if 28 has been played
	beq $t8, 7,B4				# Try to play 28
	beq $t9, 7,A4
	beq $t8, 4,B7			
	beq $t9, 4,A7
.globl skip28
skip28:
	j computerInput
	
A1:						# Computer changes A to 1
 	li $v0, 4   				
 	la $a0, stringA				
 	syscall
 	
 	li $v0, 4   				
 	la $a0, string2				
 	syscall
 	
 	li $a0, 1
 	li $v0, 1				
 	syscall
 	
 	li $t8,1
 	sb $t8,A
 	
 	li $v0, 4   				
 	la $a0, newline				
 	syscall
 	
 	j validiationForComputer
 A2:						# Computer changes A to 2
 	li $v0, 4   				
 	la $a0, stringA				
 	syscall
 	
 	li $v0, 4   				
 	la $a0, string2				
 	syscall
 	
 	li $a0, 2
 	li $v0, 1			
 	syscall
 	
 	li $t8,2
 	sb $t8,A
 	
 	li $v0, 4   				
 	la $a0, newline				
 	syscall
 	
 	j validiationForComputer
 A3:						# Computer changes A to 3
 	li $v0, 4   				
 	la $a0, stringA				
 	syscall
 	
 	li $v0, 4   				
 	la $a0, string2				
 	syscall
 	
 	li $a0, 3
 	li $v0, 1			
 	syscall
 	
 	li $t8,3
 	sb $t8,A
 	
 	li $v0, 4   				
 	la $a0, newline				
 	syscall
 	
 	j validiationForComputer
 A4:						# Computer changes A to 4
 	li $v0, 4   				
 	la $a0, stringA				
 	syscall
 	
 	li $v0, 4   				
 	la $a0, string2				
 	syscall
 	
 	li $a0, 4
 	li $v0, 1			
 	syscall
 	
 	li $t8,4
 	sb $t8,A
 	
 	li $v0, 4   				
 	la $a0, newline				
 	syscall
 	
 	j validiationForComputer
 A5:						# Computer changes A to 5
 	li $v0, 4   				
 	la $a0, stringA				
 	syscall
 	
 	li $v0, 4   				
 	la $a0, string2				
 	syscall
 	
 	li $a0, 5
 	li $v0, 1			
 	syscall
 	
 	li $t8,5
 	sb $t8,A
 	
 	li $v0, 4   				
 	la $a0, newline				
 	syscall
 	
 	j validiationForComputer
 A6:						# Computer changes A to 6
 	li $v0, 4   				
 	la $a0, stringA				
 	syscall
 	
 	li $v0, 4   				
 	la $a0, string2				
 	syscall
 	
 	li $a0, 6
 	li $v0, 1			
 	syscall
 	
 	li $t8,6
 	sb $t8,A
 	
 	li $v0, 4   				
 	la $a0, newline				
 	syscall
 	
 	j validiationForComputer
 A7:						# Computer changes A to 7
 	li $v0, 4   				
 	la $a0, stringA				
 	syscall
 	
 	li $v0, 4   				
 	la $a0, string2				
 	syscall
 	
 	li $a0, 7
 	li $v0, 1			
 	syscall
 	
 	li $t8,7
 	sb $t8,A
 	
 	li $v0, 4   				
 	la $a0, newline				
 	syscall
 	
 	j validiationForComputer
 A8:						# Computer changes A to 8
 	li $v0, 4   				
 	la $a0, stringA				
 	syscall
 	
 	li $v0, 4   				
 	la $a0, string2				
 	syscall
 	
 	li $a0, 8
 	li $v0, 1			
 	syscall
 	
 	li $t8,8
 	sb $t8,A
 	
 	li $v0, 4   				
 	la $a0, newline				
 	syscall
 	
 	j validiationForComputer
 A9:						# Computer changes A to 9
 	li $v0, 4   				
 	la $a0, stringA				
 	syscall
 	
 	li $v0, 4   				
 	la $a0, string2				
 	syscall
 	
 	li $a0, 9
 	li $v0, 1			
 	syscall
 	
 	li $t8,9
 	sb $t8,A
 	
 	li $v0, 4   				
 	la $a0, newline				
 	syscall
 	
 	j validiationForComputer
 B1:						# Computer changes B to 1
 	li $v0, 4   				
 	la $a0, stringB				
 	syscall
 	
 	li $v0, 4   				
 	la $a0, string2				
 	syscall
 	
 	li $a0, 1
 	li $v0, 1			
 	syscall
 	
 	li $t9,1
 	sb $t9,B
 	
 	li $v0, 4   				
 	la $a0, newline				
 	syscall
 	
 	j validiationForComputer
 B2:						# Computer changes B to 2
 	li $v0, 4   				
 	la $a0, stringB				
 	syscall
 	
 	li $v0, 4   				
 	la $a0, string2				
 	syscall
 	
 	li $a0, 2
 	li $v0, 1			
 	syscall
 	
 	li $t9,2
 	sb $t9,B
 	
 	li $v0, 4   				
 	la $a0, newline				
 	syscall
 	
 	j validiationForComputer
 B3:						# Computer changes B to 3
 	li $v0, 4   			
 	la $a0, stringB				
 	syscall
 	
 	li $v0, 4   				
 	la $a0, string2				
 	syscall
 	
 	li $a0, 3
 	li $v0, 1			
 	syscall
 	
 	li $t9,3
 	sb $t9,B
 	
 	li $v0, 4   				
 	la $a0, newline				
 	syscall
 	
 	j validiationForComputer
 B4:						# Computer changes B to 4
 	li $v0, 4   				
 	la $a0, stringB				
 	syscall
 	
 	li $v0, 4   				
 	la $a0, string2				
 	syscall
 	
 	li $a0, 4
 	li $v0, 1			
 	syscall
 	
 	li $t9,4
 	sb $t9,B
 	
 	li $v0, 4   				
 	la $a0, newline				
 	syscall
 	
 	j validiationForComputer
 B5:						# Computer changes B to 5
 	li $v0, 4   				
 	la $a0, stringB				
 	syscall
 	
 	li $v0, 4   				
 	la $a0, string2				
 	syscall
 	
 	li $a0, 5
 	li $v0, 1			
 	syscall
 	
 	li $t9,5
 	sb $t9,B
 	
 	li $v0, 4   				
 	la $a0, newline				
 	syscall
 	
 	j validiationForComputer
 B6:						# Computer changes B to 6
 	li $v0, 4   				
 	la $a0, stringB				
 	syscall
 	
 	li $v0, 4   				
 	la $a0, string2				
 	syscall
 	
 	li $a0, 6
 	li $v0, 1			
 	syscall
 	
 	li $t9,6
 	sb $t9,B
 	
 	li $v0, 4   				
 	la $a0, newline				
 	syscall
 	
 	j validiationForComputer
 B7:						# Computer changes B to 7
 	li $v0, 4   				
 	la $a0, stringB				
 	syscall
 	
 	li $v0, 4   				
 	la $a0, string2				
 	syscall
 	
 	li $a0, 7
 	li $v0, 1			
 	syscall
 	
 	li $t9,7
 	sb $t9,B
 	
 	li $v0, 4   				
 	la $a0, newline				
 	syscall
 	
 	j validiationForComputer
 B8:						# Computer changes B to 8
 	li $v0, 4   				
 	la $a0, stringB				
 	syscall
 	
 	li $v0, 4   				
 	la $a0, string2				
 	syscall
 	
 	li $a0, 8
 	li $v0, 1			
 	syscall
 	
 	li $t9,8
 	sb $t9,B
 	
 	li $v0, 4   				
 	la $a0, newline				
 	syscall
 	
 	j validiationForComputer
 B9:						# Computer changes B to 9
 	li $v0, 4   				
 	la $a0, stringB				
 	syscall
 	
 	li $v0, 4   				
 	la $a0, string2				
 	syscall
 	
 	li $a0, 9
 	li $v0, 1			
 	syscall
 	
 	li $t9,9
 	sb $t9,B
 	
 	li $v0, 4   				
 	la $a0, newline				
 	syscall
 	
 	j validiationForComputer	
 	
first:						# Computer changes A to 9
 	li $v0, 4   				
 	la $a0, stringA				
 	syscall
 	
 	li $v0, 4   				
 	la $a0, string2				
 	syscall
 	
 	li $a0, 4
 	li $v0, 1			
 	syscall
 	
 	li $t8,4
 	sb $t8,A
 	
 	li $v0, 4   				
 	la $a0, newline				
 	syscall
 	
 	jr $ra
exit:
        li $v0, 10				# Exit the program
        syscall
