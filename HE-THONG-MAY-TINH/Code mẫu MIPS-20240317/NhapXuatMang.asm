#Nhap va xuat mang 1 chieu cac so nguyen n phan tu
.data
	tb1: .asciiz "Nhap n: "
	tb2: .asciiz "a["
	tb3: .asciiz "]: "
	tb4: .asciiz "Mang vua nhap la: "
	n: .word 0
	arr: .space 400
.text

	#xuat tb1
	li $v0,4
	la $a0,tb1
	syscall 
	
	#Nhap n
	li $v0,5
	syscall

	#luu vao n
	sw $v0,n

	#Load n vao s0
	lw $s0,n

	#load dia chi arr vao s1
	la $s1,arr

	#khoi tao vong lap
	li $t0,0 #i = 0
LapNhap:
	#xuat tb2
	li $v0,4
	la $a0,tb2
	syscall 
	
	#xuat i
	li $v0,1
	move $a0,$t0
	syscall

	#xuat tb3
	li $v0,4
	la $a0,tb3
	syscall 

	#nhap a[i]
	li $v0,5
	syscall 

	#luu vao a[i]
	sw $v0,($s1) 

	#Tang dia chi mang
	addi $s1,$s1,4

	#Tang i
	addi $t0,$t0,1

	#kiem tra i < n thi LapNhap
	blt $t0,$s0,LapNhap


	#xuat tb4
	li $v0,4
	la $a0,tb4
	syscall 

	#load dia chi arr vao s1
	la $s1,arr

	#khoi tao vong lap
	li $t0,0 #i = 0

LapXuat:
	#xuat a[i]
	li $v0,1
	lw $a0,($s1) # $a0 = a[i]
	syscall
	
	#xuat khoang trang
	li $v0,11
	li $a0,' '
	syscall
	
	#Tang dia chi mang
	addi $s1,$s1,4

	#Tang i
	addi $t0,$t0,1

	#kiem tra i < n thi LapXuat
	blt $t0,$s0,LapXuat

	