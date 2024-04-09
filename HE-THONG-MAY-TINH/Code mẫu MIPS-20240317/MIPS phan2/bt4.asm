#Bài tập 4. Viết chương trình nhập số nguyên n. Kiểm tra n có là số đối xưng hay không ?
.data
	tb1: .asciiz "Nhap so nguyen N: "
	tb2: .asciiz "\nN la so doi xung."
	tb3: .asciiz "\nN KHONG la so doi xung."
	tb4: .asciiz "\n"
.text
	#xuat tb1
	li $v0,4
	la $a0,tb1
	syscall 

	#read số nguyên n, n read được nằm ở thanh ghi v0, load v0 vào thanh ghi t0
	li $v0,5
	syscall 

	move $t0, $v0
	# tao ban sao n vao t1
	move $t1, $v0
	
	#Khởi tạo hang so 10 
	li $t2,10
	
	li $s0,0 #thanh ghi chua so dao, khoi tao = 0

	j Lap
exit:
	li $v0,10  # syscall to end the program
    	syscall
kt_sodoixung:
	beq $s0,$t1,print_sodoixung
	
	j print_khong_sodoixung
print_sodoixung:
	# nếu $s0 = t0, đây là số doi xung
	#xuat tb2
	li $v0,4
	la $a0,tb2
	syscall 
	
	j exit
print_khong_sodoixung:
	#xuat tb3
	li $v0,4
	la $a0,tb3
	syscall 
	
	j exit
Lap:
	# neu t0 ==0, nhay vao nhan kt so dữ xung
	beq $t0,0,kt_sodoixung
	
	# Lấy chữ số cuối của số nguyên sử dụng toán tử chia lấy dư (Modulus)
	# nRem = nInput % 10;
	div $t0,$t2
	mfhi $t4 # load so du từ $hi vào $t4
	

	#// Nhân số đảo với 10 và cộng với chữ số cuối
	# nSoDao = (nSoDao * 10) + nRem;
	mult $s0,$t2
	mflo $s0 # load tich từ $lo vào $s0

	# cong nRem vao $s0
	add $s0,$s0,$t4

	#Xóa chữ số cuối bằng cách sử dụng toán tử chia lấy phần nguyên (Division)
	#nInput = nInput / 10;
	div $t0,$t2
	mflo $t0 # load phan nguyen từ $lo vào $t0 de tiep tuc lap

	j Lap
