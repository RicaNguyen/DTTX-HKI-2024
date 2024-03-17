.data 
	str1: .asciiz "Nhap mot chuoi"
	str2: .asciiz "Chuoi da nhap"
.text
	#Xuat chuoi str1
	#li $v0,4 # $v0 = 4
	la $a0,str1 #a0 = address str
	syscall
