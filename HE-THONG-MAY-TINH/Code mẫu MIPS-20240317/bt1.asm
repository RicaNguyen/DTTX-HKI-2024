.data 
	str1: .asciiz "Nhap mot chuoi: "
	str2: .asciiz "Chuoi da nhap: "
	str3: .space 30
.text
	#Xuat chuoi str1
	li $v0,4 # $v0 = 4 print_string
	la $a0,str1 #a0 = address str1
	syscall

	#Nhap chuoi str1
	li $v0,8 # $v0 = 8 read_string
	la $a0,str3
	li $a1,30
	syscall

	#Xuat chuoi str1
	li $v0,4 # $v0 = 4 print_string
	la $a0,str2 #a0 = address str2

	syscall
	li $v0,4 # $v0 = 4 print_string
	la $a0,str3 #a1 = address str3
	syscall