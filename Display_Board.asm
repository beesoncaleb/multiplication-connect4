.data
h_sep: .asciiz "+---+---+---+---+---+---+\n|"
end_sep: .asciiz "\n+---+---+---+---+---+---+\n"
v_sep: .asciiz "|"
new_row: .asciiz "\n"
user:	.asciiz	" X "
comp:	.asciiz " O "
whitespace: .asciiz " "
A: .byte 0
B: .byte 0

display_board: 
    .byte 1, 2, 3, 4,  5, 6
    .byte 7, 8, 9, 10, 12, 14
    .byte 15, 16, 18, 20, 21, 24 
    .byte 25, 27, 28, 30, 32, 35 
    .byte 36, 40, 42, 45, 48, 49 
    .byte 54, 56, 63, 64, 72, 81 


.text
.globl print_board

print_board:
	sb $t8, A				# Saves the value of $t8 into A
 	sb $t9, B				# Saves the value of $t9 into B

	li $t0, 0 # game board counter 
	li $t1, 36 # array length
	li $t9, 6 #mod constant 
	la $a2, display_board

	loop: 
		beq $t0, $t1, exit_loop
		
		div $t0, $t9  
		mfhi $t8
		beq $t8, $zero, next_row 

	row_return:

		lbu $t2, 0($a1) #Load the byte in the index into $t2
		lbu $t3 0($a2) #load the byte from display board 

		li $v0, 11 
		beq $t2, 0, print_num 
		beq $t2, 1, print_user 
		beq $t2, 2, print_compt
		
	print_return:
		addi $t0, $t0, 1 
		addi $a1, $a1, 1 
		addi $a2, $a2, 1

		li $v0, 4
		la $a0, v_sep 
		syscall 

		j loop
		

#print the number 
print_num: 
	li $t7, 8
	bgt $t0, $t7, print_double

	li $v0 4 
	la $a0, whitespace
	syscall 
	
	li $v0, 1
	add $a0, $zero, $t3
	syscall

	li $v0 4 
	la $a0, whitespace
	syscall 

	j print_return

print_double: 

	li $v0, 1
	add $a0, $zero, $t3
	syscall
	
	li $v0 4 
	la $a0, whitespace
	syscall 
	
	j print_return

print_user: 
	li $v0, 4
	la $a0, user
	syscall
	j print_return

print_compt: 
	li $v0, 4
	la $a0, comp
	syscall
	j print_return


next_row: 
	li $v0, 4
	la $a0, new_row 
	syscall 

	la $a0, h_sep 
	syscall

	j row_return  


exit_loop:
	li $v0, 4 
	la $a0, end_sep
	syscall
	
	lb $t8, A			# Loads A into $a0
        lb $t9, B			# Loads B into $a0
	
	jr	$ra







