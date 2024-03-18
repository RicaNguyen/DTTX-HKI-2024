.data 
	str1: .asciiz "Nhap so thu 1: "
	str2: .asciiz "Nhap so thu 2: "
	strTong: .asciiz "\nTong la: "
	strHieu: .asciiz "\nHieu la: "
	strTich: .asciiz "\nTich la: "
	strThuong: .asciiz "\nThuong la: "
	strDu: .asciiz " du "
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

	# load num1, num2 vào thanh ghi s0,s1 (thanh ghi lưu trị giá trị trong suốt hàm)
	lw $s0,num1 #s0 = num1
	lw $s1,num2 #s1 = num2
  
	
	# print strTong
	li $v0, 4
	la $a0, strTong
	syscall

  	# num1+num2 trả kq cho thanh ghi $a0 và print
    	add $a0,$s0,$s1 # $t0 = $s0 + $s1
	li $v0, 1 # print a0 = num1+num2 above
	syscall

	# print strHieu
	li $v0, 4
	la $a0, strHieu
	syscall

  	# num1-num2 trả kq cho thanh ghi $a0 và print
    	sub $a0,$s0,$s1 # $t0 = $s0 + $s1
	li $v0, 1 # print a0 = num1+num2 above
	syscall

	# print strTich
	li $v0, 4
	la $a0, strTich
	syscall

  	# num1 * num2 trả kq cho thanh ghi $a0 và print
    	mult $s0,$s1 # thanh ghi $lo = $s0 * $s1
	mflo $a0 # load value từ $lo vào $a0
	li $v0, 1 # print a0 = num1 * num2 above
	syscall

	# print strThuong
	li $v0, 4
	la $a0, strThuong
	syscall

  	# num1 / num2 trả kq cho thanh ghi $a0 và print
    	div $s0,$s1 # thanh ghi $lo = $s0 * $s1 (thuonng), $hi là số dư
	mflo $a0 # load value từ $lo vào $a0
	li $v0, 1 # print $a0 - thương
	syscall

	# print strDu
	li $v0, 4
	la $a0, strDu
	syscall

	mfhi $a0 # load value từ $hi vào $a0
	li $v0, 1 # print $a0 - số dư
	syscall
exit:
    li $v0,10  # syscall to end the program
    syscall