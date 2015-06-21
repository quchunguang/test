.section .data
scores:
	.long 1,2,3,4,5


.section .text
.global _start
_start:
	movl	$0,%ebx
	movl	$scores,%eax
loop:
	incl	%ebx
	cmpl	$5,%ebx
	jne	loop
	#movl	4(%eax),%ebx
	movl	$3,%eax
	movl	scores(,%eax,4),%ebx
	cmpl	$3,%ebx
	movl	$1,%eax
	cmova	%eax,%ebx
	int	$0x80
