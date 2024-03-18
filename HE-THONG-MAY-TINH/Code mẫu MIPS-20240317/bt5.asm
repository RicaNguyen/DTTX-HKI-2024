.data 
	str1: .asciiz "Nhap so thu 1: "
	str2: .asciiz "Nhap so thu 2: "
	message: .asciiz "\nSo lon hon la: "
	num1: .word 0
	num2: .word 0
.text
.globl  main
main:
	# print nhãn str1
	li $v0, 4
	la $a0, str1
	syscall

	# read số nguyên, số nguyên read được nằm ở thanh ghi v0, lưu giá trị vào bộ nhớ ram num1
    	li $v0, 5
    	syscall
	sw $v0,num1

	# print nhãn str2
	li $v0, 4
	la $a0, str2
	syscall
	
	# read số nguyên, số nguyên read được nằm ở thanh ghi v0, lưu giá trị vào bộ nhớ ram num2
    	li $v0, 5
    	syscall
	sw $v0,num2

	# load num1, num2 vào thanh ghi t0,t1
	lw $t0,num1 #t0 = num1
	lw $t1,num2 #t1 = num2
  
	# ref https://stackoverflow.com/questions/39563118/how-to-compare-values-within-registers-in-mips
	# nếu $t0 <= $t1, gọi nhánh numberSmaller
	blt $t0,$t1,numberSmaller

	# nếu $t0 >= $t1, gọi nhánh numberLarger
	bgt $t0,$t1,numberLarger

exit:
    li $v0,10  # syscall to end the program
    syscall

numberSmaller:
	li $v0,4
    	la $a0,message
    	syscall
	
	# $s0 < $s1, print $t1
	li $v0,1
    	move $a0,$t1
    	syscall
    	j exit

numberLarger:
    	li $v0,4
    	la $a0,message
    	syscall

	# $s0 > $s1, print $t0
	li $v0,1
    	move $a0,$t0
    	syscall
    	j exit
