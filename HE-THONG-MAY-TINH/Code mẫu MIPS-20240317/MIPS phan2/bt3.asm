.data
	tb1: .asciiz "Nhap so nguyen N: "
	tb2: .asciiz "\nN la so chinh phuong."
	tb3: .asciiz "\nN KHONG la so chinh phuong."
.text
	#xuat tb1
	li $v0,4
	la $a0,tb1
	syscall 

	#read số nguyên n, n read được nằm ở thanh ghi v0, load v0 vào thanh ghi t0
	li $v0,5
	syscall 
	move $t0, $v0


	#Khởi tạo giá trị vòng lặp
	# cho i chạy từ 1 đến  <= n/2, nếu n chia hết cho i thì sum+=i
	li $s0,2 #gán s0 = hằng số 2
	li $s1,0 #gán s0 = 0 - toonrng các ước của n
	li $t1,1 #i = 1

	div $t0,$s0 # t0/s0 (n/2), thương lưu ở $lo
	mflo $t2 # load thương từ $lo vào $t2 (= n/2)

	j Lap
exit:
	li $v0,10  # syscall to end the program
    	syscall
print_chinhphuong:
	# nếu $s0 = t0, đây là số hoàn thiện
	#xuat tb2
	li $v0,4
	la $a0,tb2
	syscall 
	
	j exit
print_khong_chinhphuong:
	#xuat tb3
	li $v0,4
	la $a0,tb3
	syscall 
	
	j exit
Lap:
	beq $t0,1,print_chinhphuong

	#Neu i > n/2 thì nhảy vào nhãn print_khong_chinhphuong
	bgt $t1,$t2,print_khong_chinhphuong

	mult $t1,$t1 # i*i
	mflo $t4 # load tích từ $lo vào $t4
	
	# nếu $t4 = t0, nhảy đến nhãn print_chinhphuong
	beq $t4,$t0,print_chinhphuong

	# tăng i
	addi $t1,$t1,1 #i++

	j Lap
