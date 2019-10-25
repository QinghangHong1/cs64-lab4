# MedianNumbers.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

.data

	# TODO: Complete these declarations / initializations

	enter:.asciiz "Enter the next number:\n"

	median: .asciiz "Median: "
	
	newLine: .asciiz "\n"

#Text Area (i.e. instructions)
.text

main:

	li $v0, 4
	la $a0, enter
	syscall
	li $v0, 5
	syscall
	move $t0, $v0

	li $v0, 4
        la $a0, enter
        syscall
        li $v0, 5
        syscall
        move $t1, $v0

	li $v0, 4
        la $a0, enter
        syscall
        li $v0, 5
        syscall
        move $t2, $v0
	
	blt $t0, $t1, zeroLessThanOne
	bgt $t0, $t2, zeroGreaterThanTwo
	j zero
	zeroGreaterThanTwo:
	blt $t1, $t2, two
	j one
	zeroLessThanOne:
	blt $t0, $t2, oneOrTwo
	j zero
	oneOrTwo:
	blt $t1, $t2, one
	two:
	move $t3, $t2
	j print
	one:
	move $t3,$t1
	j print
	zero:
	move $t3, $t0
	print:
	li $v0,4
	la $a0, median
	syscall
	li $v0, 1
	move $a0, $t3
	syscall
	li $v0, 4
	la $a0, newLine
	syscall
exit:
	# Exit
	li $v0, 10
	syscall

