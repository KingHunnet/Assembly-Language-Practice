	.file	"mystery.c"
	.text
.globl add
	.type	add, @function
add:
.LFB32:
	.cfi_startproc
	leal	(%rsi,%rdi), %eax
	ret
	.cfi_endproc
.LFE32:
	.size	add, .-add
.globl dothething
	.type	dothething, @function
dothething:
.LFB33:
	.cfi_startproc
	movq	%rbx, -16(%rsp)
	movq	%rbp, -8(%rsp)
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -16
	.cfi_offset 3, -24
	movl	%edi, %ebx
	movl	$0, %eax
	testl	%edi, %edi
	je	.L5
	movb	$1, %al
	cmpl	$1, %edi
	je	.L5
	leal	-2(%rbx), %edi
	call	dothething
	movl	%eax, %ebp
	leal	-1(%rbx), %edi
	call	dothething
	movl	%ebp, %esi
	movl	%eax, %edi
	call	add
.L5:
	movq	8(%rsp), %rbx
	movq	16(%rsp), %rbp
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE33:
	.size	dothething, .-dothething
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Value:   %d\n"
	.text
.globl main
	.type	main, @function
main:
.LFB34:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	8(%rsi), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	movl	%eax, %edi
	call	dothething
	movl	%eax, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE34:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.4.7 20120313 (Red Hat 4.4.7-16)"
	.section	.note.GNU-stack,"",@progbits
