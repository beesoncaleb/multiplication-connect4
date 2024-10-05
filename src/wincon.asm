.text

.globl	checkWin

#a1 is address of board array of 36 bytes
#index is position on board from 0-35, 0 value is empty, 1 value is user, 2 value is computer
#win conditions:
#	4 values in a sequence with an interval of 5, 6, or 7
#	4 values in a row within a row, row intervals [0,5], [6,11], [12,17], [18,23], [24,29], [30,35]

#will return value in $v1, 0 for no win condition fulfilled, 1 for user win condition fulfilled, 2 for computer win condition fulfilled
checkWin:
	#use $s0 for index variable
	addi	$sp, $sp, -4
	sw	$s0, ($sp)
	add	$s0, $zero, $zero
	
	#use $s2 to end loop, set to 33 since no need to check 33-35
	addi	$sp, $sp, -4
	sw 	$s2, ($sp)
	add	$s2, $zero, $zero
	addi	$s2, $s2, 33
	
	#save $ra so that we can use subroutines for more efficient condition checking
	addi	$sp, $sp, -4
	sw	$ra, ($sp)
	
#loop to iterate by index
loop:
	beq	$s0, $s2, exit
	
#row conditional
	li	$t0, 6
	
	div	$s0, $t0
	mfhi	$t2
	beq	$t2, $zero, rowj	#branch to row if index % 6 == 0
	
	addi	$t1, $s0, -1
	div	$t1, $t0
	mfhi	$t2
	beq	$t2, $zero rowj		#branch to row if (index-1) % 6 == 0
	
	addi	$t1, $t1, -1
	div	$t1, $t0
	mfhi	$t2
	beq	$t2, $zero, rowj	#branch to row if (index-2) % 6 == 0
	
	j	norow
rowj:
	jal	row
norow:

#column conditional
	addi	$t1, $s0, -18
	bge	$t1, $zero, nocolumn
	jal	col			#branch to column if (index - 18) < 0
	
nocolumn:

#diagR conditional
	addi	$t1, $s0, -18
	bge	$t1, $zero, nodiagR
	
	li	$t0, 6
	
	div	$s0, $t0
	mfhi	$t2
	beq	$t2, $zero, diagRj	#branch to diagR if index % 6 == 0 and (index-18) < 0
	
	addi	$t1, $s0, -1
	div	$t1, $t0
	mfhi	$t2
	beq	$t2, $zero diagRj	#branch to diagR if (index-1) % 6 == 0 and (index-18) < 0
	
	addi	$t1, $t1, -1
	div	$t1, $t0
	mfhi	$t2
	beq	$t2, $zero, diagRj	#branch to diagR if (index-2) % 6 == 0 and (index-18) < 0
	
	j	nodiagR
diagRj:	
	jal diagR
nodiagR:

#diagL conditional
	addi	$t1, $s0, -18
	bge	$t1, $zero, nodiagL
	
	li	$t0, 6
	
	addi	$t1, $s0, -3
	div	$t1, $t0
	mfhi	$t2
	beq	$t2, $zero, diagLj	#branch to diagR if (index-3)% 6 == 0 and (index-18) < 0
	
	addi	$t1, $t1, -1
	div	$t1, $t0
	mfhi	$t2
	beq	$t2, $zero diagLj	#branch to diagR if (index-4) % 6 == 0 and (index-18) < 0
	
	addi	$t1, $t1, -1
	div	$t1, $t0
	mfhi	$t2
	beq	$t2, $zero, diagLj	#branch to diagR if (index-5) % 6 == 0 and (index-18) < 0
	
	j	nodiagL
diagLj:	
	jal diagL
nodiagL:

addi	$s0, $s0, 1
j	loop

#subroutine to check row
row:
	add	$t2, $zero, $zero
	add	$t3, $zero, $zero
	add	$t0, $a1, $s0		#set $t0 to address of index value in board array
	
	
	lb	$t1, ($t0)
	add	$t2, $t2, $t1
	beq	$t2, $t3, rowexit
	add	$t3, $t2, $zero
	
	lb	$t1, 1($t0)
	add	$t2, $t2, $t1
	beq	$t2, $t3, rowexit
	add	$t3, $t2, $zero
	
	lb	$t1, 2($t0)
	add	$t2, $t2, $t1
	beq	$t2, $t3, rowexit
	add	$t3, $t2, $zero

	lb	$t1, 3($t0)
	add	$t2, $t2, $t1		#$t2 equal to sum of values in 4 subsequent board positions, as long as there were no 0s in sequence
	beq	$t2, $t3, rowexit
	
	li	$t0, 4
	beq	$t2, $t0, userwin	#if sum equal to 4, then user wins
	
	li	$t0, 8
	beq 	$t2, $t0, compwin	#if sum equal to 8, then computer wins
	
rowexit:
	jr	$ra			#else no win condition, exit subroutine
	
#subroutine to check diagonal down to the right
diagR:
	add	$t2, $zero, $zero
	add	$t3, $zero, $zero
	add	$t0, $a1, $s0		#set $t0 to address of index value in board array
	
	lb	$t1, ($t0)
	add	$t2, $t2, $t1
	beq	$t2, $t3, diagRexit
	add	$t3, $t2, $zero
	
	lb	$t1, 7($t0)
	add	$t2, $t2, $t1
	beq	$t2, $t3, diagRexit
	add	$t3, $t2, $zero

	lb	$t1, 14($t0)
	add	$t2, $t2, $t1
	beq	$t2, $t3, diagRexit
	add	$t3, $t2, $zero

	lb	$t1, 21($t0)
	add	$t2, $t2, $t1		#$t2 equal to sum of value in a diagonal down to the right as long as there were no 0s in sequence
	beq	$t2, $t3, diagRexit	
	
	li	$t0, 4
	beq	$t2, $t0, userwin	#if sum equal to 4, then user wins
	
	li	$t0, 8
	beq 	$t2, $t0, compwin	#if sum equal to 8, then computer wins
	
diagRexit:
	jr	$ra			#else no win condition, exit subroutine
	
#subroutine to check diagonal down to the left
diagL:
	add	$t2, $zero, $zero
	add	$t3, $zero, $zero
	add	$t0, $a1, $s0		#set $t0 to address of index value in board array
	
	lb	$t1, ($t0)
	add	$t2, $t2, $t1
	beq	$t2, $t3, diagLexit
	add	$t3, $t2, $zero
	
	lb	$t1, 5($t0)
	add	$t2, $t2, $t1
	beq	$t2, $t3, diagLexit
	add	$t3, $t2, $zero

	lb	$t1, 10($t0)
	add	$t2, $t2, $t1
	beq	$t2, $t3, diagLexit
	add	$t3, $t2, $zero

	lb	$t1, 15($t0)
	add	$t2, $t2, $t1		#$t2 equal to sum of value in a diagonal down to the left, as long as there were no 0s in sequence
	beq	$t2, $t3, diagLexit
	
	li	$t0, 4
	beq	$t2, $t0, userwin	#if sum equal to 4, then user wins
	
	li	$t0, 8
	beq 	$t2, $t0, compwin	#if sum equal to 8, then computer wins
	
diagLexit:
	jr	$ra			#else no win condition, exit subroutine

#subroutine to check columns
col:	
	add	$t2, $zero, $zero
	add	$t3, $zero, $zero
	add	$t0, $a1, $s0		#set $t0 to address of index value in board array
	
	lb	$t1, ($t0)
	add	$t2, $t2, $t1
	beq	$t2, $t3, colexit
	add	$t3, $t2, $zero
	
	lb	$t1, 6($t0)
	add	$t2, $t2, $t1
	beq	$t2, $t3, colexit
	add	$t3, $t2, $zero

	lb	$t1, 12($t0)
	add	$t2, $t2, $t1
	beq	$t2, $t3, colexit
	add	$t3, $t2, $zero

	lb	$t1, 18($t0)
	add	$t2, $t2, $t1		#$t2 equal to sum of value in a downward column, as long as there were no 0s in sequence
	beq	$t2, $t3, colexit

	li	$t0, 4
	beq	$t2, $t0, userwin	#if sum equal to 4, then user wins
	
	li	$t0, 8
	beq 	$t2, $t0, compwin	#if sum equal to 8, then computer wins
	
colexit:
	jr	$ra			#else no win condition, exit subroutine

userwin:
	j	win
compwin:
	j	lose

exit:
	li	$v1, 0
	
	lw	$ra, ($sp)
	addi	$sp, $sp, 4
	
	lw	$s2, ($sp)
	addi	$sp, $sp, 4
	
	lw 	$s0, ($sp)
	addi	$sp, $sp, 4
	jr	$ra

	
