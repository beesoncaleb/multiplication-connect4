.data
	topY2: .asciiz    "       __"
	topY: .asciiz     "\\  /  /  \\  |    |"
	midY: .asciiz     " \\/  |    | |    |"
	midY2: .asciiz    " |   |    | |    |"
	bottomY: .asciiz  " |    \\__/   \\__/"
	topL2: .asciiz    "      __    __   __"
	topL: .asciiz     "|    /  \\  /    /  \\"
	midL: .asciiz     "|   |    | |    |   |"
	midL2: .asciiz    "|   |    |   \\  |__/ "
	bottomL: .asciiz  "|__  \\__/   __/ \\__ "
	newline: .asciiz "\n"
.text
.globl lose
lose:
	li $v0, 4
    	la $a0, topY2
    	syscall
    	
    	li $v0, 4
    	la $a0, newline
    	syscall

	li $v0, 4
    	la $a0, topY
    	syscall
    	
    	li $v0, 4
    	la $a0, newline
    	syscall
    	
    	li $v0, 4
    	la $a0, midY
    	syscall
    	
    	li $v0, 4
    	la $a0, newline
    	syscall
    	
    	li $v0, 4
    	la $a0, midY2
    	syscall
    	
    	li $v0, 4
    	la $a0, newline
    	syscall
    	
    	li $v0, 4
    	la $a0, bottomY
    	syscall
    	
    	li $v0, 4
    	la $a0, newline
    	syscall
    	
    	li $v0, 4
    	la $a0, topL2
    	syscall
    	
    	li $v0, 4
    	la $a0, newline
    	syscall

	li $v0, 4
    	la $a0, topL
    	syscall
    	
    	li $v0, 4
    	la $a0, newline
    	syscall
    	
    	li $v0, 4
    	la $a0, midL
    	syscall
    	
    	li $v0, 4
    	la $a0, newline
    	syscall
    	
    	li $v0, 4
    	la $a0, midL2
    	syscall
    	
    	li $v0, 4
    	la $a0, newline
    	syscall
    	
    	li $v0, 4
    	la $a0, bottomL
    	syscall
    	
    	li $v0, 4
    	la $a0, newline
    	syscall

	li $a1, 1000
    	li $a2, 63
    	li $a3, 100
    	
    	li $v0, 33     
    	li $a0, 69  
    	syscall
    	
    	li $v0, 33      
    	li $a0, 72  
    	syscall
    	
    	li $v0, 33      
    	li $a0, 62  
    	syscall
    	
    	li $a1, 4000
    	li $a2, 63
    	
    	li $v0, 33      
    	li $a0, 64    
    	syscall
exit:
        li $v0, 10			# Exit the program
        syscall
