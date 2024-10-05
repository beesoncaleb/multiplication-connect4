.data
numbers: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 14, 15, 16, 18, 20, 21, 24, 25, 27, 28, 30, 32, 35, 36, 40, 42, 45, 48, 49, 54, 56, 63, 64, 72, 81
numOne: .word 0
numTwo: .word 0
index: .word 0
mutiple: .word 0
answer: .word 0
message1: .asciiz "Enter number one-nine: "
message2: .asciiz "Number already used\n"
message3: .asciiz "Product: "
newline: .asciiz "\n"

.text
.globl validiationForComputer
validiationForComputer:
    sb $t8, numOne				# Saves the value in $t8 to numOne
    sb $t9, numTwo				# Saves the value in $t9 to numTwo

    # Load values into registers
    lw $t0, numOne
    lw $t1, numTwo
    mul $t2, $t0, $t1  # mutiple = numOne * numTwo
    sw $t2, mutiple

    # Initialize loop counter
    li $t3, 0

loopComputer:
    # Exit loop if counter exceeds the array length
    bge $t3, 144, not_foundComputer # 36 words * 4 bytes/word = 144 bytes

    # Load current number from the array
    lw $t4, numbers($t3)

    # Compare with mutiple
    beq $t4, $t2, foundComputer

    # Increment counter and continue loop
    addi $t3, $t3, 4  # increment by 4 because each word is 4 bytes
    j loopComputer

foundComputer:
    li $v0, 4
    la $a0, message3
    syscall
	
    # Print the matching number
    lw $a0, mutiple
    li $v0, 1
    syscall
    
    li $v0, 4   				
    la $a0, newline				# Prints newline
    syscall

    # Store the answer
    sw $t2, answer

    # Set the matched number to 0
    sw $zero, numbers($t3)
    
    div $s6, $t3, 4

    jr	$ra
	 
not_foundComputer:
    j computerInput

.globl validiationForComputer5_12_21_32
validiationForComputer5_12_21_32:
    li $t2, 99
    li $t3, 0

    li $t3, 16
    lw $t4, numbers($t3)
    beq $t4, $t2, skip21
    
    li $t3, 40
    lw $t4, numbers($t3)
    beq $t4, $t2, skip21
    
    li $t3, 64
    lw $t4, numbers($t3)
    beq $t4, $t2, skip21
    
    li $t3, 88
    lw $t4, numbers($t3)
    beq $t4, $t2, skip21

    j valid5_12_21_32
    
.globl validiationForComputer9_20_49_32
validiationForComputer9_20_49_32:
    li $t2, 99
    li $t3, 0

    li $t3, 32
    lw $t4, numbers($t3)
    beq $t4, $t2, skip9
    
    li $t3, 60
    lw $t4, numbers($t3)
    beq $t4, $t2, skip9
    
    li $t3, 88
    lw $t4, numbers($t3)
    beq $t4, $t2, skip9
    
    li $t3, 116
    lw $t4, numbers($t3)
    beq $t4, $t2, skip9

    j valid9_20_49_32
    
.globl validiationForComputer72_16_45_28
validiationForComputer72_16_45_28:
    li $t2, 99
    li $t3, 0

    li $t3, 32
    lw $t4, numbers($t3)
    beq $t4, $t2, computerInput
    
    li $t3, 80
    lw $t4, numbers($t3)
    beq $t4, $t2, computerInput
    
    li $t3, 108
    lw $t4, numbers($t3)
    beq $t4, $t2, computerInput
    
    li $t3, 136
    lw $t4, numbers($t3)
    beq $t4, $t2, computerInput

    j valid72_16_45_28

.globl validiationForComputer32
validiationForComputer32:
    li $t2, 32
    sw $t2, mutiple

    # Initialize loop counter
    li $t3, 0

loop32:
    # Exit loop if counter exceeds the array length
    bge $t3, 144, skip32 # 36 words * 4 bytes/word = 144 bytes

    # Load current number from the array
    lw $t4, numbers($t3)

    # Compare with mutiple
    beq $t4, $t2, valid32

    # Increment counter and continue loop
    addi $t3, $t3, 4  # increment by 4 because each word is 4 bytes
    j loop32
    
.globl validiationForComputer32.2
validiationForComputer32.2:
    li $t2, 32
    sw $t2, mutiple

    # Initialize loop counter
    li $t3, 0

loop32.2:
    # Exit loop if counter exceeds the array length
    bge $t3, 144, skip32.2 # 36 words * 4 bytes/word = 144 bytes

    # Load current number from the array
    lw $t4, numbers($t3)

    # Compare with mutiple
    beq $t4, $t2, valid32.2

    # Increment counter and continue loop
    addi $t3, $t3, 4  # increment by 4 because each word is 4 bytes
    j loop32.2
    
.globl validiationForComputer12
validiationForComputer12:
    li $t2, 12
    sw $t2, mutiple

    # Initialize loop counter
    li $t3, 0

loop12:
    # Exit loop if counter exceeds the array length
    bge $t3, 144, skip12 # 36 words * 4 bytes/word = 144 bytes

    # Load current number from the array
    lw $t4, numbers($t3)

    # Compare with mutiple
    beq $t4, $t2, valid12

    # Increment counter and continue loop
    addi $t3, $t3, 4  # increment by 4 because each word is 4 bytes
    j loop12
    
.globl validiationForComputer5
validiationForComputer5:
    li $t2, 5
    sw $t2, mutiple

    # Initialize loop counter
    li $t3, 0

loop5:
    # Exit loop if counter exceeds the array length
    bge $t3, 144, skip5 # 36 words * 4 bytes/word = 144 bytes

    # Load current number from the array
    lw $t4, numbers($t3)

    # Compare with mutiple
    beq $t4, $t2, valid5

    # Increment counter and continue loop
    addi $t3, $t3, 4  # increment by 4 because each word is 4 bytes
    j loop5
    
.globl validiationForComputer21
validiationForComputer21:
    li $t2, 21
    sw $t2, mutiple

    # Initialize loop counter
    li $t3, 0

loop21:
    # Exit loop if counter exceeds the array length
    bge $t3, 144, skip21 # 36 words * 4 bytes/word = 144 bytes

    # Load current number from the array
    lw $t4, numbers($t3)

    # Compare with mutiple
    beq $t4, $t2, valid21

    # Increment counter and continue loop
    addi $t3, $t3, 4  # increment by 4 because each word is 4 bytes
    j loop21
    
.globl validiationForComputer20
validiationForComputer20:
    li $t2, 20
    sw $t2, mutiple

    # Initialize loop counter
    li $t3, 0

loop20:
    # Exit loop if counter exceeds the array length
    bge $t3, 144, skip20 # 36 words * 4 bytes/word = 144 bytes

    # Load current number from the array
    lw $t4, numbers($t3)

    # Compare with mutiple
    beq $t4, $t2, valid20

    # Increment counter and continue loop
    addi $t3, $t3, 4  # increment by 4 because each word is 4 bytes
    j loop20
    
.globl validiationForComputer49
validiationForComputer49:
    li $t2, 49
    sw $t2, mutiple

    # Initialize loop counter
    li $t3, 0

loop49:
    # Exit loop if counter exceeds the array length
    bge $t3, 144, skip49 # 36 words * 4 bytes/word = 144 bytes

    # Load current number from the array
    lw $t4, numbers($t3)

    # Compare with mutiple
    beq $t4, $t2, valid49

    # Increment counter and continue loop
    addi $t3, $t3, 4  # increment by 4 because each word is 4 bytes
    j loop49
    
.globl validiationForComputer9
validiationForComputer9:
    li $t2, 9
    sw $t2, mutiple

    # Initialize loop counter
    li $t3, 0

loop9:
    # Exit loop if counter exceeds the array length
    bge $t3, 144, skip9 # 36 words * 4 bytes/word = 144 bytes

    # Load current number from the array
    lw $t4, numbers($t3)

    # Compare with mutiple
    beq $t4, $t2, valid9

    # Increment counter and continue loop
    addi $t3, $t3, 4  # increment by 4 because each word is 4 bytes
    j loop9
    
.globl validiationForComputer72
validiationForComputer72:
    li $t2, 72
    sw $t2, mutiple

    # Initialize loop counter
    li $t3, 0

loop72:
    # Exit loop if counter exceeds the array length
    bge $t3, 144, skip72 # 36 words * 4 bytes/word = 144 bytes

    # Load current number from the array
    lw $t4, numbers($t3)

    # Compare with mutiple
    beq $t4, $t2, valid72

    # Increment counter and continue loop
    addi $t3, $t3, 4  # increment by 4 because each word is 4 bytes
    j loop72
    
.globl validiationForComputer16
validiationForComputer16:
    li $t2, 16
    sw $t2, mutiple

    # Initialize loop counter
    li $t3, 0

loop16:
    # Exit loop if counter exceeds the array length
    bge $t3, 144, skip16 # 36 words * 4 bytes/word = 144 bytes

    # Load current number from the array
    lw $t4, numbers($t3)

    # Compare with mutiple
    beq $t4, $t2, valid16

    # Increment counter and continue loop
    addi $t3, $t3, 4  # increment by 4 because each word is 4 bytes
    j loop16
    
.globl validiationForComputer45
validiationForComputer45:
    li $t2, 45
    sw $t2, mutiple

    # Initialize loop counter
    li $t3, 0

loop45:
    # Exit loop if counter exceeds the array length
    bge $t3, 144, skip45 # 36 words * 4 bytes/word = 144 bytes

    # Load current number from the array
    lw $t4, numbers($t3)

    # Compare with mutiple
    beq $t4, $t2, valid45

    # Increment counter and continue loop
    addi $t3, $t3, 4  # increment by 4 because each word is 4 bytes
    j loop45
    
.globl validiationForComputer28
validiationForComputer28:
    li $t2, 28
    sw $t2, mutiple

    # Initialize loop counter
    li $t3, 0

loop28:
    # Exit loop if counter exceeds the array length
    bge $t3, 144, skip28 # 36 words * 4 bytes/word = 144 bytes

    # Load current number from the array
    lw $t4, numbers($t3)

    # Compare with mutiple
    beq $t4, $t2, valid28

    # Increment counter and continue loop
    addi $t3, $t3, 4  # increment by 4 because each word is 4 bytes
    j loop28


.globl validiationForComputerA
validiationForComputerA:
    sb $t8, numOne				# Saves the value in $t8 to numOne
    sb $t9, numTwo				# Saves the value in $t9 to numTwo

    # Load values into registers
    lw $t0, numOne
    lw $t1, numTwo
    mul $t2, $t0, $t1  # mutiple = numOne * numTwo
    sw $t2, mutiple

    # Initialize loop counter
    li $t3, 0
    
    
loopA:
    # Exit loop if counter exceeds the array length
    bge $t3, 144, not_foundA  # 36 words * 4 bytes/word = 144 bytes

    # Load current number from the array
    lw $t4, numbers($t3)

    # Compare with mutiple
    beq $t4, $t2, foundA

    # Increment counter and continue loop
    addi $t3, $t3, 4  # increment by 4 because each word is 4 bytes
    j loopA

foundA:
    # Store the answer
    sw $t2, answer

    # Set the matched number to 0
    sw $zero, numbers($t3)
    
    div $s6, $t3, 4
    
    j validA
    
not_foundA:
    # Check if answer is still 0
    lw $t5, answer
    j randomA
	

.globl validiationForComputerB
validiationForComputerB:
    sb $t8, numOne				# Saves the value in $t8 to numOne
    sb $t9, numTwo				# Saves the value in $t9 to numTwo

    # Load values into registers
    lw $t0, numOne
    lw $t1, numTwo
    mul $t2, $t0, $t1  # mutiple = numOne * numTwo
    sw $t2, mutiple

    # Initialize loop counter
    li $t3, 0
    
    
loopB:
    # Exit loop if counter exceeds the array length
    bge $t3, 144, not_foundB  # 36 words * 4 bytes/word = 144 bytes

    # Load current number from the array
    lw $t4, numbers($t3)

    # Compare with mutiple
    beq $t4, $t2, foundB

    # Increment counter and continue loop
    addi $t3, $t3, 4  # increment by 4 because each word is 4 bytes
    j loopB

foundB:
    # Store the answer
    sw $t2, answer

    # Set the matched number to 0
    sw $zero, numbers($t3)
    
    div $s6, $t3, 4
    
    j validB
    
not_foundB:
    # Check if answer is still 0
    lw $t5, answer
    j randomB
		
	
	
.globl validiationForUser
validiationForUser:
    sb $t8, numOne				# Saves the value in $t8 to numOne
    sb $t9, numTwo				# Saves the value in $t9 to numTwo

    # Load values into registers
    lw $t0, numOne
    lw $t1, numTwo
    mul $t2, $t0, $t1  # mutiple = numOne * numTwo
    sw $t2, mutiple

    # Initialize loop counter
    li $t3, 0

loop:
    # Exit loop if counter exceeds the array length
    bge $t3, 144, not_found # 36 words * 4 bytes/word = 144 bytes

    # Load current number from the array
    lw $t4, numbers($t3)

    # Compare with mutiple
    beq $t4, $t2, found

    # Increment counter and continue loop
    addi $t3, $t3, 4  # increment by 4 because each word is 4 bytes
    j loop

found:
    li $v0, 4
    la $a0, message3
    syscall
	
    # Print the matching number
    lw $a0, mutiple
    li $v0, 1
    syscall
    
    li $v0, 4   				
    la $a0, newline				# Prints newline
    syscall

    # Store the answer
    sw $t2, answer

    li $t1, 99
    # Set the matched number to 0
    sw $t1, numbers($t3)
    
    div $s7, $t3, 4
    
    #jal print_board
    jr	$ra
	 
not_found:
    # Check if answer is still 0
    lw $t5, answer
    
    # Print the error message
    li $v0, 4
    la $a0, message2
    syscall
    
    move $t8, $t6		  					
    move $t9, $t7	
    
    j userInput
