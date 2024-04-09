#Nhap va xuat mang 1 chieu cac so nguyen n phan tu
.data
	tb1: .asciiz "Nhap n: "
	tb2: .asciiz "a["
	tb3: .asciiz "]: "
	tb4: .asciiz "\nMang vua nhap la: "
	tb5: .asciiz "\nCac so nguyen to la: "
	tb6: .asciiz "\nSo nguyen MAX la: "
	tb7: .asciiz "\nTB mang la: "
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
	jal LapNhap # nhay vao LapNhap, luu dia chi tro ve vao $ra

	
	#xuat tb4
	li $v0,4
	la $a0,tb4
	syscall 

	#load dia chi arr vao s1
	la $s1,arr
	#khoi tao vong lap
	li $t0,0 #i = 0
	jal LapXuat # nhay vao LapXuat, luu dia chi tro ve vao $ra


	#xuat tb5
	li $v0,4
	la $a0,tb5
	syscall 

	#load dia chi arr vao s1
	la $s1,arr
	#khoi tao vong lap
	li $t0,0 #i = 0
	jal LapXuatNguyenTo # nhay vao LapXuatNguyenTo, luu dia chi tro ve vao $ra

	#load dia chi arr vao s1
	la $s1,arr
	#khoi tao vong lap
	li $t0,0 #i = 0
	lw $a2,($s1) # $a2 = a[i] la max luc khoi tao
	jal LapTimMax # nhay vao LapTimMax, luu dia chi tro ve vao $ra

	#load dia chi arr vao s1
	la $s1,arr
	#khoi tao vong lap
	li $t0,0 #i = 0
	li $s2,0 #sumi = 0
	jal TinhTrungBinhMang # nhay vao TinhTrungBinhMang, luu dia chi tro ve vao $ra

	j exit
exit:
	li $v0,10  # syscall to end the program
    	syscall
TinhTrungBinhMang:
	#kiem tra index >=n thi PrintTinhTrungBinhMang
	bge $t0,$s0,PrintTinhTrungBinhMang

	# load a[i] vao a1 de goi ham KiemTraMax
	lw $a1,($s1) # $a1 = a[i]
	add $s2,$s2,$a1
	
	#Tang dia chi mang
	addi $s1,$s1,4
	#Tang i
	addi $t0,$t0,1
	j TinhTrungBinhMang

PrintTinhTrungBinhMang:
	div $s2,$s0
	
	mflo $t1 # load phan nguyen từ $lo vào $t1

	#xuat tb7
	li $v0,4
	la $a0,tb7
	syscall 
	
	li $v0,1
	move $a0,$t1
	syscall

	jr $ra
LapTimMax:
	#kiem tra index >=n thi Xuat Max
	bge $t0,$s0,PrintMax

	# load a[i] vao a1 de goi ham KiemTraMax
	lw $a1,($s1) # $a1 = a[i]
	
	bgt $a1,$a2,XuLyMax

	#Tang dia chi mang
	addi $s1,$s1,4
	#Tang i
	addi $t0,$t0,1

	j LapTimMax
XuLyMax:
	# gan a2=a1
	move $a2,$a1

	#Tang dia chi mang
	addi $s1,$s1,4
	#Tang i
	addi $t0,$t0,1

	j LapTimMax
PrintMax:
	#xuat tb6
	li $v0,4
	la $a0,tb6
	syscall
	
	li $v0,1
	move $a0,$a2
	syscall

	jr $ra	
ExitToRa:
	jr $ra
tang_count:
	addi $a3,$a3,1 #count++
	j KiemTraNguyenTo
KiemTraNguyenTo:
	# nhan number tu a1, a2 la index, a3 la sl cac uoc
	# nếu n =2,3. n là nguyên tố
	beq $a1,1,ExitToRa
	beq $a1,2,PrintNguyenToAndExit
	beq $a1,3,PrintNguyenToAndExit

	#Neu i >= n thì nhảy vào nhãn ExitKiemTraNguyenTo
	bge $a2,$a1,ExitKiemTraNguyenTo

	div $a1,$a2 # a1 chia cho a2, số dư nằm ở $hi
	mfhi $t4 # load số dư từ $hi vào $t4
	
	addi $a2,$a2,1 #index++

	# nếu $t4 = 0, nhảy đến nhãn tang_count
	beq $t4,0,tang_count
	
	j KiemTraNguyenTo
PrintNguyenToAndExit:
	li $v0,1
	move $a0, $a1
	syscall

	#xuat khoang trang
	li $v0,11
	li $a0,' '
	syscall

	jr $ra
ExitKiemTraNguyenTo:
	# kết thúc lặp, kt nếu count ==0, n là số nguyên tố
	beq $a3,0,PrintNguyenToAndExit
	jr $ra

LapXuatNguyenTo:
	# load a[i] vao a0 de goi ham KiemTraNguyenTo
	lw $a1,($s1) # $a0 = a[i]

	li $a2,2 # cho j chay tu 2 den <a[i]
	li $a3,0 # tong cac uoc cua a[i]=0
	# backup $ra vao t7
	move $t7, $ra
	jal KiemTraNguyenTo
	# restore a1 $ra vao 
	move $ra,$t7

	#Tang dia chi mang
	addi $s1,$s1,4

	#Tang i
	addi $t0,$t0,1

	#kiem tra i < n thi LapXuatNguyenTo
	blt $t0,$s0,LapXuatNguyenTo
	
	jr $ra # tro ve noi goi ham nay
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
	
	jr $ra # tro ve noi goi ham nay
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
	
	jr $ra # tro ve noi goi ham nay
	
