
.globl Factorial
	.type	Factorial, @function
Factorial:
  # Your code for Factorial should go here
.LFB32:
	.cfi_startproc
	testl	%edi, %edi
	je	.L2
	movl	$0, %eax
	cmpl	$12, %edi
	jg	.L4
	testl	%edi, %edi
	jle	.L2
	movl	$1, %edx
	movb	$1, %al
.L5:
	imull	%edx, %eax
	addl	$1, %edx
	cmpl	%edx, %edi
	jge	.L5
	rep
	ret
.L2:
	movl	$1, %eax
.L4:
	rep
	ret
	.cfi_endproc  

.globl nCr
	.type	nCr, @function
nCr:
  # Your code for nCr should go here
.LFB33:
	.cfi_startproc
	movq	%rbx, -32(%rsp)
	movq	%rbp, -24(%rsp)
	movq	%r12, -16(%rsp)
	movq	%r13, -8(%rsp)
	subq	$32, %rsp
	.cfi_def_cfa_offset 40
	.cfi_offset 13, -16
	.cfi_offset 12, -24
	.cfi_offset 6, -32
	.cfi_offset 3, -40
	movl	%edi, %ebx
	movl	%esi, %ebp
	call	Factorial
	movl	%eax, %r13d
	movl	%ebp, %edi
	call	Factorial
	movl	%eax, %r12d
	movl	%ebx, %edi
	subl	%ebp, %edi
	call	Factorial
	imull	%eax, %r12d
	movl	%r13d, %edx
	movl	%r13d, %eax
	sarl	$31, %edx
	idivl	%r12d
	movq	(%rsp), %rbx
	movq	8(%rsp), %rbp
	movq	16(%rsp), %r12
	movq	24(%rsp), %r13
	addq	$32, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc


