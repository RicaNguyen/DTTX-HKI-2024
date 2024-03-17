#Nhap n. Tinh va xuat tong tu 1 den n
.data
	tb1: .asciiz "Nhap n: "
	tb2: .asciiz "Tong 1 den n la: "
	n: .word 0
	kq: .word 0
.text
	#xuat tb1
	li $v0,4
	la $a0,tb1
	syscall 

	#nhap n
	li $v0,5
	syscall 

	#Luu vao n
	sw $v0,n

	#load n vao s0
	lw $s0,n

	#khoi tao vong lap
	li $s1,0 #S = 0
	li $t0,1 #i = 1
Lap:
	add $s1,$s1,$t0 # s = s+i
	addi $t0,$t0,1 #i++
	#Neu i <= n thi Lap
	ble $t0,$s0,Lap
	
	#Luu s1 vao kq
	sw $s1,kq
	
	#xuat tb2
	li $v0,4
	la $a0,tb2
	syscall 

	#xuat kq
	li $v0,1
	lw $a0,kq
	syscall
	