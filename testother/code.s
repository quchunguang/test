	.file	"code.c"
	.text
	.p2align 4,,15
.globl sum
	.type	sum, @function
sum:
	pushl	%ebp
	movl	%esp, %ebp
	movl	12(%ebp), %eax
	addl	8(%ebp), %eax
	addl	%eax, accum
	popl	%ebp
	ret
	.size	sum, .-sum
.globl accum
	.data
	.align 4
	.type	accum, @object
	.size	accum, 4
accum:
	.long	305419896
	.ident	"GCC: (Ubuntu 4.3.2-1ubuntu12) 4.3.2"
	.section	.note.GNU-stack,"",@progbits
