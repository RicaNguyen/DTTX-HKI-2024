#Nhap ho ten + nam sinh, xuat xin chao ho ten + tuoi
.data 
	tb1: .asciiz "Nhap ho ten: "
	tb2: .asciiz "Nhap nam sinh: "
	tb3: .asciiz "Xin chao "
	tb4: .asciiz "Tuoi ban la: "
	ns: .word 0
	ten: .space 30
	
.text 
	#xuat tb1
	li $v0,4
	la $a0,tb1
	syscall 
	
	#Nhap ten
	li $v0,8
	la $a0,ten
	li $a1,30
	syscall 

	#xuat tb2
	li $v0,4
	la $a0,tb2
	syscall 
	
	#nhap ns
	li $v0,5
	syscall 
	
	#luu vao ns
	sw $v0,ns

	#xuat tb3
	li $v0,4
	la $a0,tb3
	syscall 

	#xuat ten
	li $v0,4
	la $a0,ten
	syscall

	#tinh tuoi
	lw $t0,ns #t0 = ns
	li $t1,2024 #t1 = 2024
	sub $t2,$t1,$t0 

	#xuat tb4
	li $v0,4
	la $a0,tb4
	syscall 

	#xuat tuoi
	li $v0,1
	move $a0,$t2 #$a0 = $t2
	syscall

	
	