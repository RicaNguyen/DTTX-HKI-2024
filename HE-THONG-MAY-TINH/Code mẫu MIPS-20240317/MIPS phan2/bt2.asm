.data
	tb1: .asciiz "Nhap so nguyen N: "
	tb2: .asciiz "\nN la so hoan thien."
	tb3: .asciiz "\nN KHONG la so hoan thien."
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
	li $s1,0 #gán s0 = 0 - tổng các ước của n
	li $t1,1 #i = 1

	div $t0,$s0 # t0/s0 (n/2), thương lưu ở $lo
	mflo $t2 # load thương từ $lo vào $t2 (= n/2)

	j Lap
exit:
	li $v0,10  # syscall to end the program
    	syscall
print_hoanthien:
	# nếu $s0 = t0, đây là số hoàn thiện
	#xuat tb2
	li $v0,4
	la $a0,tb2
	syscall 
	
	j exit
print_khong_hoanthien:
	#xuat tb3
	li $v0,4
	la $a0,tb3
	syscall 
	
	j exit
kiemtra:
	# nếu $s1 = t0, đây là số hoàn thiện
	beq $s1,$t0,print_hoanthien

	j print_khong_hoanthien
sum_uoc:
	add $s1,$s1,$t1 # s1=s1+ $t1 (biến i hiện hành)

	# tăng i
	addi $t1,$t1,1 #i++
	j Lap

Lap:
	#Neu i > n/2 thì nhảy vào nhãn KiemTra
	bgt $t1,$t2,kiemtra

	div $t0,$t1 # n chia cho i, số dư nằm ở $hi
	mfhi $t4 # load số dư từ $hi vào $t4
	
	# nếu $t4 = 0, nhảy đến nhãn sum_uoc
	beq $t4,0,sum_uoc

	# tăng i
	addi $t1,$t1,1 #i++

	j Lap
