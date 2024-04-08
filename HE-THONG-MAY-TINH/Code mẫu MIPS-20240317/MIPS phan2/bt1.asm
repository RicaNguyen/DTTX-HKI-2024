.data
	tb1: .asciiz "Nhap so nguyen N: "
	tb2: .asciiz "\nN la so nguyen to."
	tb3: .asciiz "\nN KHONG la so nguyen to."
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
	# cho i chạy từ 2 đến  <= n/2, nếu n chia hết cho 2 thì count++
	li $s0,2 #gán s0 = hằng số 2
	li $s1,0 #gán s1 = hằng số 0, biến count
	li $t1,2 #i = 2

	div $t0,$s0 # t0/so (n/2), thương lưu ở $lo
	mflo $t2 # load thương từ $lo vào $t2 (= n/2)
	
	# nếu n =2,3. n là nguyên tố
	ble $t0,2,print_la_nguyen_to
	ble $t0,3,print_la_nguyen_to

	j Lap
exit:
	li $v0,10  # syscall to end the program
    	syscall

tang_count:
	addi $s1,$s1,1 #count++
	j Lap

print_la_nguyen_to:
	#xuat tb2, là số nguyên tố
	li $v0,4
	la $a0,tb2
	syscall 
	
	j exit
print_khong_la_nguyen_to:
	#xuat tb3, là số nguyên tố
	li $v0,4
	la $a0,tb3
	syscall 
	
	j exit
Lap:
	div $t0,$t1 # n chia cho i, số dư nằm ở $hi
	mfhi $t4 # load số dư từ $hi vào $t4
	
	# tăng i
	addi $t1,$t1,1 #i++

	# nếu $t4 = 0, nhảy đến nhãn tang_count
	beq $t4,0,tang_count

	#Neu i <= n/2 thì nhảy vào nhãn Lap
	ble $t1,$t2,Lap
	
	# kết thúc lặp, kt nếu count ==0, n là số nguyên tố
	ble $s1,0,print_la_nguyen_to

	j print_khong_la_nguyen_to
	
