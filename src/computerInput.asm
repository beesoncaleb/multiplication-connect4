.data
	string1: .asciiz "Computer changes "
	string2: .asciiz " to "
	stringA: .asciiz "A"
	stringB: .asciiz "B"
	newline: .asciiz "\n"
	message3: .asciiz "Product: "
	random: .space 4 
	A: .byte 0
	B: .byte 0
.text
.globl computerInput
computerInput:
	sb $t8, A				# Saves the value of $t8 into A
 	sb $t9, B				# Saves the value of $t9 into B

	beq $t8, $zero,changeA			# Checks if first move
	beq $t9, $zero,changeA

	li $a1, 2  				# Highest bound.
    	li $v0, 42  				# Generates the random number.
    	syscall
    	
    	li $t1,1
    	beq $a0, $t1,changeB			# Determines if the computer changes A or B
changeA:
	li $v0, 4   				
 	la $a0, string1				# Prints string1
 	syscall
 	
 	li $v0, 4   				
 	la $a0, stringA				# Prints stringA
 	syscall
 	
 	li $v0, 4   				
 	la $a0, string2				# Prints string2
 	syscall
.globl randomA
randomA:	
 	li $a1, 9  				# Highest bound.
    	li $v0, 42  				# Generates the random number.
    	syscall
    
    	add $a0, $a0, 1 			#Lowest bound	
    	sb $a0, random

 	lb $t8,random
 	sb $t8,A				# Saves random into A
 	
 	beq $t9, $zero,validA
 	j validiationForComputerA				# Jumps to userInput
.globl validA
validA: 	
 	lb $a0, random
 	li $v0, 1				# Prints the random int
 	syscall
 	
 	li $v0, 4   				
 	la $a0, newline				# Prints newline
 	syscall
 	
 	#move $a0,$t8
 	#li $v0, 1				# Prints the value of A
 	#syscall
 	
 	#li $v0, 4   				
 	#la $a0, newline				# Prints newline
 	#syscall
 	
 	#move $a0,$t9
 	#li $v0, 1				# Prints the value of B
 	#syscall
 	
 	#li $v0, 4   				
 	#la $a0, newline				# Prints newline
 	#syscall
 	
 	li $v0, 4
    	la $a0, message3
    	syscall
    
    	# Print the matching number
    	mul $a0, $t8, $t9
    	li $v0, 1
    	syscall
    
    	#li $v0, 4   				
    	#la $a0, newline				# Prints newline
    	#syscall
 	
 	jr	$ra
 	
 	
changeB:
	li $v0, 4   				
 	la $a0, string1				# Prints string1
 	syscall
 	
 	li $v0, 4   				
 	la $a0, stringB				# Prints stringA
 	syscall
 	
 	li $v0, 4   				
 	la $a0, string2				# Prints string2
 	syscall
.globl randomB
randomB:	
 	li $a1, 9  				# Highest bound.
    	li $v0, 42  				# Generates the random number.
    	syscall
    
    	add $a0, $a0, 1 			#Lowest bound	
    	sb $a0, random

 	lb $t9,random
 	sb $t9,B				# Saves random into A
 	
 	j validiationForComputerB				# Jumps to userInput
.globl validB
validB: 	
 	lb $a0, random
 	li $v0, 1				# Prints the random int
 	syscall
 	
 	li $v0, 4   				
 	la $a0, newline				# Prints newline
 	syscall
 	
 	#move $a0,$t8
 	#li $v0, 1				# Prints the value of A
 	#syscall
 	
 	#li $v0, 4   				
 	#la $a0, newline			# Prints newline
 	#syscall
 	
 	#move $a0,$t9
 	#li $v0, 1				# Prints the value of B
 	#syscall
 	
 	#li $v0, 4   				
 	#la $a0, newline			# Prints newline
 	#syscall
 	
 	li $v0, 4
    	la $a0, message3
    	syscall
    
    	# Print the matching number
    	mul $a0, $t8, $t9
    	li $v0, 1
    	syscall
    
    	#li $v0, 4   				
    	#la $a0, newline				# Prints newline
    	#syscall
 	
 	jr	$ra

exit:
        li $v0, 10				# Exit the program
        syscall
