#Viet ham tinh tong tu 1 den N
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

	#Nhap n
	li $v0,5
	syscall 

	#luu vao n
	sw $v0,n

	#Truyen tham so $a0 = n
	lw $a0,n

	#goi ham
	jal _TinhTong

	#Lay kq tra ve trong $v0
	sw $v0, kq

	#xuat tb2
	li $v0,4
	la $a0,tb2
	syscall 

	#xuat kq
	li $v0,1
	lw $a0,kq
	syscall 

	#ket thuc chuong trinh
	li $v0,10
	syscall
#===============================
#dau thu tuc
_TinhTong:
	#khai bao stack
	addi $sp,$sp,-20 
	#Backup $ra
	sw $ra,($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	sw $t0,12($sp)

#Than thu tuc
	move $s0,$a0  #s0 = n
	#khoi tao vong lap
	li $s1,0 # s = 0
	li $t0,1 # i = 1
_TinhTong.Lap:
	add $s1,$s1,$t0 # s = s + i
	addi $t0,$t0,1 #i++
	#i <= n thi Lap
	ble $t0,$s0,_TinhTong.Lap
	
	#Luu kq tra ve vao $v0
	move $v0,$s1 # $v0 = $s1

#Cuoi thu tuc
	#phuc hoi cac thanh ghi
	lw $ra,($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $t0,12($sp)

	#xoa stack
	addi $sp,$sp,20 

	#quay ve
	jr $ra

	
	
	