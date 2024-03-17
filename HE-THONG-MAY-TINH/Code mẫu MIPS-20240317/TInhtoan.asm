#Nhap vao 2 so nguyen a,b. 
#Tinh va xuat tong hieu, tich, thuong a,b.
.data 
	tb1: .asciiz "Nhap a: "
	tb2: .asciiz "Nhap b: "
	tb3: .asciiz "\nTong la: "
	tb4: .asciiz "\nHieu la: "
	tb5: .asciiz "\nTich la: "
	tb6: .asciiz "\nThuong la: "
	num1: .word 0
	num2: .word 0
	kq: .word 0
.text 
	#xuat tb1
	li $v0,4	
	la $a0,tb1
	syscall 
	
	#nhap a
	li $v0,5
	syscall 

	#luu vao num1
	sw $v0,num1

	#xuat tb2
	li $v0,4	
	la $a0,tb2
	syscall 
	
	#nhap b
	li $v0,5
	syscall 

	#luu vao num2
	sw $v0,num2

	#load a vao s0, b vao s1
	lw $s0,num1 #s0 = num1
	lw $s1,num2 #s1 = num2
	
	#tinh tong
	add $t0,$s0,$s1 # $t0 = $s0 + $s1
	sw $t0,kq

	#xuat tb3
	li $v0,4
	la $a0,tb3
	syscall 
	
	#xuat kq
	li $v0,1
	lw $a0,kq
	syscall 
	
	#tinh hieu
	sub $t0,$s0,$s1 # $t0 = $s0 - $s1
	sw $t0,kq

	#xuat tb4
	li $v0,4
	la $a0,tb4
	syscall 
	
	#xuat kq
	li $v0,1
	lw $a0,kq
	syscall 
	
	#tinh tich
	mult $s0,$s1 # lo = $s0 * $s1
	mflo $t0 # t0 = lo
	sw $t0,kq 

	#xuat tb5
	li $v0,4
	la $a0,tb5
	syscall 
	
	#xuat kq
	li $v0,1
	lw $a0,kq
	syscall 

	#tinh thuong
	div $s0,$s1 # lo = $s0 / $s1
	mflo $t0 # t0 = lo
	sw $t0,kq 

	#xuat tb6
	li $v0,4
	la $a0,tb6
	syscall 
	
	#xuat kq
	li $v0,1
	lw $a0,kq
	syscall 
