# Factorial.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

# Assembly version of:
#   int n, fn=1;
#   cout << "Enter the number:\n";
#   cin >> n;
#   for (int x = 2; x <= n; x++) {
#       fn = fn * x;
#   }
#   cout << "Factorial is:\n" << fn << "\n";
#
.data
	enter: .asciiz "Enter the number:\n"
	factorial: .asciiz "Factorial is:\n"
	newLine: .asciiz "\n"
#Text Area (i.e. instructions)
.text
main:
	li $v0, 4
	la $a0, enter
	syscall
	li $v0, 5
	syscall
	move $t0, $v0 #n

	li $t1, 1 #fn
	li $t2, 2 #x
	loop:
	blt $t0, $t2, print
	mult $t1, $t2
	mflo $t1
	addi $t2, $t2, 1
	j loop
	
	print:
	li $v0, 4
	la $a0, factorial
	syscall
	li $v0, 1
	move $a0, $t1
	syscall
	li $v0, 4
	la $a0, newLine
	syscall
	
exit:
	# Exit
	li $v0, 10
	syscall
