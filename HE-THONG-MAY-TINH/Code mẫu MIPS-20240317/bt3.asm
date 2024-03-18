.data 
	str1: .asciiz "Nhap mot ky tu: "
	kytuthuong: .asciiz "Ky tu thuong: "
	new_line: .asciiz "\n"

.text
	# print nhãn str1
	li $v0, 4
	la $a0, str1
	syscall


	# read 1 char, char read được nằm ở thanh ghi v0, load v0 vào thanh ghi t0
    	li $v0, 12
    	syscall
	
	move $t0, $v0

    	# Đổi char in hoa thành thường bằng cách +32 theo mã ASCII
    	addi $t1, $t0, 32    # ký tự liền sau trong ASCII: +32
	
	# new line
	li $v0, 4
	la $a0, new_line
	syscall

	# print nhãn kytulientruoc
	li $v0, 4
	la $a0, kytuthuong
	syscall

	li $v0, 11          # Print character
    	move $a0, $t1       # Load char từ thanh ghi t1 vào thanh ghi $a0
    	syscall