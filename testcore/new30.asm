; vim: tw=78:ft=asm:ts=8:sw=8:noet
; $Id: new30.asm,v 1.3 2005/12/27 11:45:11 crq Exp $

	BITS 32
	section .data
float2: db '%20.17lf, '
float1: db '%20.17lf,', 0xa, 0

	section .text
	extern printf
	global _start

; memory stack space:
; stack top: [esp+24]: [ebp]
; counter: [esp+20]: [ebp-4]
; 2 double: [esp+4]: [ebp-20]
; fmtstr: [esp]: [ebp-24]

; FPU register stack:
; st0: M_PI/180.0
; st1: M_PI/180.0 * degree

_start:
	fldpi
	sub esp,24
	mov ebp,esp
	fst qword [ebp+4]
	mov dword [ebp],float1
	call printf

	xor ebx,ebx
	mov dword [ebp+20],ebx
	mov bl,180

	mov dword [ebp+4],ebx
 	fidiv dword [ebp+4]
	fst qword [ebp+4]
	call printf

	mov dword [ebp],float2
	shr ebx,1

.loop0:
	fld st0
	fimul dword [ebp+20]
	fsincos
	fstp qword [ebp+12]
	fstp qword [ebp+4]
	call printf
	inc dword [ebp+20]
	cmp dword [ebp+20],ebx
	jle .loop0

	; fstp ...; fix the FPU stack, not required
	; addesp,24; fix the CPU stack, not required

	xor ebx,ebx
	xor eax,eax
	inc eax
	int 0x80

; __END__
