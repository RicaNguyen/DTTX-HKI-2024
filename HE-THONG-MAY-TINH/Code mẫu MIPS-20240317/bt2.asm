.data 
	str1: .asciiz "Nhap mot ky tu: "
	kytulientruoc: .asciiz "Ky tu lien truoc: "
	kytuliensau: .asciiz "Ky tu lien sau: "
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

    	# Tính ký tự trước và sau input char bằng cách trừ / cộng 1 theo mã ASCII
    	subi $t1, $t0, 1    # ký tự liền trước trong ASCII: -1
    	addi $t2, $t0, 1    # ký tự liền sau trong ASCII: +1
	
	# new line
	li $v0, 4
	la $a0, new_line
	syscall

	# print nhãn kytulientruoc
	li $v0, 4
	la $a0, kytulientruoc
	syscall

	li $v0, 11          # Print character
    	move $a0, $t1       # Load char từ thanh ghi t1(ký tự liền trước) vào thanh ghi $a0
    	syscall
	
	# new line
	li $v0, 4
	la $a0, new_line
	syscall
	
	# pritn nhãn kytuliensau
	li $v0, 4
	la $a0, kytuliensau
	syscall

	li $v0, 11          # Print character
    	move $a0, $t2       # Load char từ thanh ghi t2(ký tự liền sau) vào thanh ghi $a0
    	syscall
