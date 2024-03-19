.data 
	str1: .asciiz "Nhap vao mot chuoi: "
	str2: .asciiz "Chuoi nguoc la: "
	str3: .space 100 # chuoi 100 ky tu
.text
.globl  main
main:
	 # khởi tạo stack, với con trỏ ở đầu stack
	addi $sp,$sp,100

	# print nhãn str1
	li $v0, 4
	la $a0, str1
	syscall

	#Nhap chuoi str1
	li $v0,8 # $v0 = 8 read_string
	la $a0,str3
	li $a1,100
	syscall
	
	# copy chuỗi từ a0 vào t0
	move $t0, $a0

    	jal split_loop

	# print str2
	li $v0, 4
	la $a0, str2
	syscall
	jal stack_loop

	jal exit

exit:
	li $v0,10  # syscall to end the program
    	syscall

split_loop:
    	lb $t5, 0($t0)       # Load a char từ string vào t5
	
	beq $t5, '\n', next_char	# nếu char là \n, ký tự xuoosnsng dòng khi user nhập chuỗi thì nhảy tới hàm next_char
    	beq $t5, $zero, split_done	# nếu char là null, nhảy tới hàm split_done
	
	# copy char từ t5 vào s0
	move $s0, $t5

	# push giá trị từ s0 vào stack
	addi $sp, $sp, -4   # Decrement the stack pointer
    	sw $s0, 0($sp)      # Store the data onto the stack

    	j next_char		# nhảy tới hàm next_char

next_char:
    	addi $t0, $t0, 1	# di chuyển tới char tiếp theo trong string
    	j split_loop		# lặp hàm split_loop

split_done:
    	jr $ra			# Return from function

# Function to loop stack và print kq
stack_loop:
    	lw $s0, 0($sp)      # Load the data from the stack
	
	# print char từ top của stack
	li $v0, 11
	move $a0, $s0
	syscall

	beq $s0, $zero, split_done	# nếu char là null, nhảy tới hàm split_done
    	addi $sp, $sp, 4	# Increment the stack pointer

	j stack_loop
