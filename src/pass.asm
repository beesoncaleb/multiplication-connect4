.data

.text
.globl pass
pass:
	li $a1, 2000
    	li $a2, 108
    	li $a3, 100
    
    	li $v0, 31      
    	li $a0, 61   
    	syscall
    	
    	j validiationForUser
