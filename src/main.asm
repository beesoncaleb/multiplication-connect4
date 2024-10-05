.data
newline: 	.asciiz "\n"
A:	.asciiz "A: "
B:	.asciiz "B: "
board:		.space	36
index: 		.word 0


.text
main:
	li	$s3, 0
	li	$s6, 0
	li	$s7, 0
loop:
	la	$a1, board
	li	$s1, 1
	li	$s2, 2
	
	jal 	computerAlg
	
	la	$a1, board
	li	$s1, 1
	li	$s2, 2
	
	beq $s3, $zero, first
	
	add 	$a2, $a1, $s6
	sb	$s2, ($a2)

	add 	$a2, $a1, $s7
	sb	$s1, ($a2)
 first:	
	jal	print_board
	la	$a1, board
	
	li $v0, 4   				
 	la $a0, A				
 	syscall
	
	move $a0,$t8
 	li $v0, 1				# Prints the value of A
 	syscall
 	
 	li $v0, 4   				
 	la $a0, newline				# Prints newline
 	syscall
 	
 	li $v0, 4   				
 	la $a0, B				
 	syscall
 	
 	move $a0,$t9
 	li $v0, 1				# Prints the value of B
 	syscall
 	
 	li $v0, 4   				
 	la $a0, newline				# Prints newline
 	syscall
	
	jal	checkWin			#returns value in $v0, 0 for no win, 1 for user win, 2 for computer win
	li	$s1, 1
	li	$s2, 2

	jal 	userInput
	
	addi $s3, $s3, 1
	
	j 	loop
	
