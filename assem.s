
.section .data
hello:
	.asciz "Hello To My Calulator\n"
title1:
	.asciz "Enter First Number: "
title2:
	.asciz "Enter Second Number: "
result_msg:
    .asciz "Result: "

.section .bss
	.lcomm num1, 6
	.lcomm num2, 6

.section .text

.global _start

_start:

#============= Echo Title
	movl $1, %eax
	movl $1, %edi
	movl $hello, %esi
	movl $8, %edx
	syscall


#============= ask first number
	movl $1, %eax
	movl $1, %edi
	movl $title1, %esi
	movl $26, %edx
	syscall

#================ set first number
	movl $0, %eax
	movl $0, %edi
	movl $num1, %esi
	movl $6, %edx
	syscall

#============= ask second number
	movl $1, %eax
	movl $1, %edi
	movl $title2, %esi
	movl $26, %edx
	syscall

#================ set Second Number
	movl $0, %eax
	movl $0, %edi
	movl $num2, %esi
	movl $6, %edx
	syscall

#================ Calulator
#	movq $num1, %rdi
#	call atoi
#	movl %eax, %ebx
	#====== seacond number
#	movq $num2, %rdi
#	call atoi
#	movl %eax, %ecx
	#======sum
#	addl %ecx, %ebx

#============= Echo Result
	movl $1, %eax
	movl $1, %edi
	movl $num1, %ebx
	addl $num2, %ebx
	movl %ebx, %esi
	movl $15, %edx
	syscall

	#exit code
	movl $60, %eax
	movl %edi, %edi
	syscall

