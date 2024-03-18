.data 
	str1: .asciiz "Nhap vao mot ky tu: "
	str2: .asciiz "\nKy tu vua nhap: "
	str3: .asciiz " la so"
	str4: .asciiz " la chu thuong"
	str5: .asciiz " la chu hoa"
	str6: .asciiz " la ky tu dac biet"
	inputChar: .word 4
.text
.globl  main
main:
	# print nhãn str1
	li $v0, 4
	la $a0, str1
	syscall

	# read 1 ký tự, ký tự read được nằm ở thanh ghi v0, lưu giá trị vào bộ nhớ ram inputChar
    	li $v0, 12
    	syscall
	sw $v0,inputChar
	
	# load inputChar vào thanh ghi t0
	move $t0, $v0
	
	# print str2
	li $v0,4
    	la $a0,str2
    	syscall
	
	# load và print inputChar
	li $v0,4
	la $a0,inputChar
    	syscall

	jal check_number_char

exit:
    li $v0,10  # syscall to end the program
    syscall
check_number_char:
	# kt liệu char có nằm giữa '0' và '9'
    	blt $t0, '0', check_lower_char  # nếu char < '0' thì nhảy qua nhãn check_lower_char
    	bgt $t0, '9', check_lower_char  # nếu char > '9' thì nhảy qua nhãn check_lower_char
	
	# nếu ct không rẽ nhánh, đây là ký tự số
 	# print " la so"
	li $v0,4
    	la $a0,str3
    	syscall

	j exit
	
check_lower_char:
	# kt liệu char có nằm giữa 'a' và 'z'
    	blt $t0, 'a', check_upper_char  # nếu char < 'a' thì nhảy qua nhãn check_upper_char
    	bgt $t0, 'z', check_upper_char  # nếu char > 'z' thì nhảy qua nhãn check_upper_char

	# nếu ct không rẽ nhánh, đây là ký tự thuong
 	# print " la chu thuong"
	li $v0,4
    	la $a0,str4
    	syscall

	j exit
check_upper_char:
	# kt liệu char có nằm giữa 'A' và 'Z'
    	blt $t0, 'A', check_special_char  # nếu char < 'A' thì nhảy qua nhãn check_special_char
    	bgt $t0, 'Z', check_special_char  # nếu char > 'Z' thì nhảy qua nhãn check_special_char

	# nếu ct không rẽ nhánh, đây là ký tự hoa
 	# print " la chu hoa"
	li $v0,4
    	la $a0,str5
    	syscall
	j exit
check_special_char:
	# load và print inputChar
	li $v0,4
    	la $a0,str6
    	syscall
	j exit