.data 
	str1: .asciiz "Nhap mot so: "
	str2: .asciiz "Tong tu 1 den "
	str3: .asciiz " la: "
	num1: .word 0
    	kq: .word 0
.text
.globl  main
main:
	# print nhãn str1
	li $v0, 4
	la $a0, str1
	syscall

	# read số nguyên, số nguyên read được nằm ở thanh ghi v0, lưu giá trị vào bộ nhớ ram num1
    	li $v0,5
    	syscall
	sw $v0,num1

	#load num1 vao s0
	lw $s0,num1
	
	#khoi tao vong lap
	li $s1,0 #S = 0
	li $t0,1 #i = 1
	
    	jal TinhTongDenN

TinhTongDenN:	
	add $s1,$s1,$t0 # s = s+i
	addi $t0,$t0,1 #i++
	#Neu i <= n thi Lap
	ble $t0,$s0,Lap
	
	#Luu s1 vao kq
	sw $s1,kq
	
	#xuat str2
	li $v0,4
	la $a0,str2
	syscall 
	
	#xuat num1
	li $v0,1
	lw $a0,num1
	syscall
	
	#xuat str3
	li $v0,4
	la $a0,str3
	syscall 

	#xuat kq
	li $v0,1
	lw $a0,kq
	syscall

