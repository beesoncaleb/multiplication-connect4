.data
	prompt1: .asciiz "Do you want to change Int A or Int B: "
	prompt2: .asciiz "Change Int A to "
	prompt3: .asciiz "Change Int B to "  
	newline: .asciiz "\n"
	space: .asciiz " "
	X: .space 4 
	A: .byte 0
	B: .byte 0 
	error1: .asciiz "Your input must be A or B"
	error2: .asciiz "Your input must be an int from 1 to 9"
	beep: .byte 72
	duration: .byte 100
	volume: .byte 127
	.align 2
.text
.globl userInput
userInput:
	sb $t8, A				# Saves the value in $t8 to A
 	sb $t9, B				# Saves the value in $t9 to B
 	
 	move $t6, $t8
 	move $t7, $t9

	beq $t8, $zero,userInput1		# Checks if first move
	beq $t9, $zero,userInput1
	j userInput2
userInput1:
	li $v0, 4   				
 	la $a0, prompt3				# Prints promt3
 	syscall
 	
 	li $v0, 5				# Loads syscall code to read an int
 	syscall
 	
 	beq $v0, 1, validInput			# Checks if the input is a valid integer from 1 to 9
 	beq $v0, 2, validInput	
 	beq $v0, 3, validInput	
 	beq $v0, 4, validInput	
 	beq $v0, 5, validInput	
 	beq $v0, 6, validInput	
 	beq $v0, 7, validInput	
 	beq $v0, 8, validInput	
 	beq $v0, 9, validInput	
 	
 	li $v0, 4   				
 	la $a0, error2				# Prints error2
 	syscall
 	
 	li $v0, 4   				
 	la $a0, newline				# Prints newline
 	syscall
 	
 	j userInput				# Jumps to userInput if it is a valid input
validInput:
 	sb $v0, B         			# Store the integer in memory at label B
 	
 	lb $a0, A				# Loads A into $a0
        move $t8,$a0				# Saves A into $t8
  
        lb $a0, B				# Loads B into $a0
        move $t9,$a0				# Saves B into $t9

 	#move $a0,$t8
 	#li $v0, 1				# Prints A
 	#syscall
 	
 	#li $v0, 4   				
 	#la $a0, newline			# Prints newline
 	#syscall
 	
 	#move $a0,$t9
 	#li $v0, 1				# Prints B
 	#syscall
 	
 	#li $v0, 4   				
 	#la $a0, newline			# Prints newline
 	#syscall
 	
  	j pass
userInput2:
	li $v0, 4   				
 	la $a0, prompt1				# Prints propt1
 	syscall
 	
 	#li $v0, 4   				
 	#la $a0, newline				# Prints newline
 	#syscall
 	
 	li $v0, 12				# Loads syscall code to read a char
 	syscall
 	sb $v0, X         			# Store the char in memory at label X
 	
 	li $v0, 4   				
 	la $a0, newline				# Prints newline
 	syscall
 	
 	li $t1, 65				# Loads 'A' into $t1
 	li $t2, 97				# Loads 'a' into $t1
 	li $t3, 66				# Loads 'B' into $t1
 	li $t4, 98				# Loads 'b' into $t1
 	lb $t5, X				# Loads the char input into $t5
 	
 	beq $t5,$t1,changeA			# If the char input is equal to 'A' jump to changeA
 	beq $t5,$t2,changeA			# If the char input is equal to 'a' jump to changeA
 	beq $t5,$t3,changeB			# If the char input is equal to 'B' jump to changeB
 	beq $t5,$t4,changeB			# If the char input is equal to 'b' jump to changeB
 
 	li $v0, 4   				
 	la $a0, error1				# Prints error1
 	syscall
 	
 	li $v0, 4   			
 	la $a0, newline				# Prints newline
 	syscall		
 	
 	j userInput2
changeA:
	li $v0, 4   				
 	la $a0, prompt2				# Prints propt2
 	syscall
 	
 	li $v0, 5				# Loads syscall code to read an int
 	syscall
 	
 	beq $v0, 1, validInputA			# Jumps to validInputA if the input it an integer from 1 to 9
 	beq $v0, 2, validInputA	
 	beq $v0, 3, validInputA	
 	beq $v0, 4, validInputA	
 	beq $v0, 5, validInputA	
 	beq $v0, 6, validInputA	
 	beq $v0, 7, validInputA	
 	beq $v0, 8, validInputA	
 	beq $v0, 9, validInputA	
 	
 	li $v0, 4   				
 	la $a0, error2				# Prints error2
 	syscall
 	
 	li $v0, 4   				
 	la $a0, newline				# Prints newline
 	syscall
 	
 	j changeA				# Jumps to changeA to redo the input
validInputA:
 	sb $v0, A         			# Store $v0 in memory at label A
 	      					
 	move $t9, $t7	
 	sb $t9, B 	
 	
 	lb $a0, A				# Loads A into $a0
        move $t8,$a0				# Moves A into $t8
 	
 	#li $v0, 4   				
 	#la $a0, newline				# Prints newline
 	#syscall
 	
 	#move $a0,$t8
 	#li $v0, 1				# Prints the value of A
 	#syscall
 	
 	#li $v0, 4   				
 	#la $a0, newline			# Prints newline
 	#syscall
 	
 	#move $a0,$t9
 	#li $v0, 1				# Prints the value of B
 	#syscall
 	
 	#li $v0, 4   				# Loads syscall code for printing a string
 	#la $a0, newline				# Prints newline
 	#syscall
 	
  	j pass
 changeB:
	li $v0, 4   				
 	la $a0, prompt3				# Prints propt3
 	syscall
 	
 	li $v0, 5				# Loads syscall code to read an int
 	syscall
 	
 	beq $v0, 1, validInputB			# Jumps to validInputB if input is an integer from 1 to 9
 	beq $v0, 2, validInputB	
 	beq $v0, 3, validInputB	
 	beq $v0, 4, validInputB	
 	beq $v0, 5, validInputB	
 	beq $v0, 6, validInputB	
 	beq $v0, 7, validInputB	
 	beq $v0, 8, validInputB	
 	beq $v0, 9, validInputB	
 	
 	li $v0, 4   				
 	la $a0, error2				# Prints error2
 	syscall
 	
 	li $v0, 4   				
 	la $a0, newline				# Prints newline
 	syscall
 	
 	j changeB				# Jumps to changeB to redo the input
validInputB: 	
 	sb $v0, B         			# Store $v0 in memory at label B
 	
 	move $t8, $t6		
 	sb $t8, A        					
 	
 	lb $a0, B				# Loads $a0 into $a0 
        move $t9,$a0				# Moves $a0 to $t9
 	
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

  	j pass
displayAB:
 	move $a0,$t8
 	li $v0, 1				# Prints the value of A
 	syscall
 	
 	li $v0, 4   				
 	la $a0, newline				# Prints newline
 	syscall
 	
 	move $a0,$t9
 	li $v0, 1				# Prints the value of B
 	syscall
 	
 	li $v0, 4   				
 	la $a0, newline				# Prints newline
 	syscall
exit:
        lw $a0, A			# Loads A into $a0
        move $a0,$t8			# Moves A into $t8
        lw $a0, B			# Loads B into $a0
        move $a0,$t9			# Moves B into $t9
        
        li $v0, 10			# Exit the program
        syscall
