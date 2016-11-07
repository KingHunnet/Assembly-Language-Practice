	.file	"mystery.c"
	.text
.globl add
	.type	add, @function
add:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	add, .-add
.globl dothething
	.type	dothething, @function
dothething:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	movl	%edi, -36(%rbp)
	movl	$0, -20(%rbp)
	cmpl	$0, -36(%rbp)
	jne	.L4
	.cfi_offset 3, -24
	movl	$0, %eax
	jmp	.L5
.L4:
	cmpl	$1, -36(%rbp)
	jne	.L6
	movl	$1, %eax
	jmp	.L5
.L6:
	movl	-36(%rbp), %eax
	subl	$2, %eax
	movl	%eax, %edi
	call	dothething
	movl	%eax, %ebx
	movl	-36(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	dothething
	movl	%ebx, %esi
	movl	%eax, %edi
	call	add
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
.L5:
	addq	$40, %rsp
	popq	%rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	dothething, .-dothething
	.section	.rodata
.LC0:
	.string	"Value:   %d\n"
	.text
.globl main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	%eax, %edi
	call	dothething
	movl	%eax, -4(%rbp)
	movl	$.LC0, %eax
	movl	-4(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.4.7 20120313 (Red Hat 4.4.7-16)"
	.section	.note.GNU-stack,"",@progbits
