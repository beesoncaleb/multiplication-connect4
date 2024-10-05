.data
	topY2: .asciiz     "         __"
	topY: .asciiz     "\\  /    /  \\    |    |"
	midY: .asciiz     " \\/    |    |   |    |"
	midY2: .asciiz    " |     |    |   |    |"
	bottomY: .asciiz  " |      \\__/     \\__/"
	topW: .asciiz    "\\    /\\    /   |  |\\  |"
	midW: .asciiz    " \\  /  \\  /    |  | \\ |"
	bottomW: .asciiz "  \\/    \\/     |  |  \\|"
	newline: .asciiz "\n"
.text
.globl win
win:
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
    	la $a0, topW
    	syscall
    	
    	li $v0, 4
    	la $a0, newline
    	syscall
    	
    	li $v0, 4
    	la $a0, midW
    	syscall
    	
    	li $v0, 4
    	la $a0, newline
    	syscall
    	
    	li $v0, 4
    	la $a0, bottomW
    	syscall
    	
    	li $v0, 4
    	la $a0, newline
    	syscall

	li $a1, 1000
    	li $a2, 24
    	li $a3, 100
    
    	li $v0, 33      
    	li $a0, 72    
    	syscall
    
    	li $v0, 33       
    	li $a0, 72     
    	syscall
    
    	li $v0, 33       
    	li $a0, 67    
    	syscall
    	
    	li $v0, 33       
    	li $a0, 67    
    	syscall
    	
    	li $v0, 33       
    	li $a0, 69    
    	syscall
    	
    	li $v0, 33       
    	li $a0, 69    
    	syscall
    	
    	li $v0, 33       
    	li $a0, 67    
    	syscall
    	
    	li $v0, 33       
    	li $a0, 65    
    	syscall
    	
    	li $v0, 33       
    	li $a0, 65    
    	syscall
    	
    	li $v0, 33       
    	li $a0, 64    
    	syscall
    	
    	li $v0, 33       
    	li $a0, 64    
    	syscall
    	
    	li $v0, 33       
    	li $a0, 62    
    	syscall
    	
    	li $v0, 33       
    	li $a0, 62    
    	syscall
    	
    	li $v0, 33       
    	li $a0, 72    
    	syscall
exit:
        li $v0, 10			# Exit the program
        syscall
