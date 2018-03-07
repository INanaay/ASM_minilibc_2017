	[BITS 64]
	global strncmp:function
strncmp:
	xor rcx, rcx
loop:
	mov r8b, [rdi + rcx]
	cmp r8b, byte 0
	jz end
	cmp [rsi + rcx], byte 0
	jz end
	cmp r8b, [rsi + rcx]
	jne end
	cmp rcx, rdx

	inc rcx
	jmp loop
end:
	sub r8b, [rsi + rcx]
	movsx rax, r8b		;moves a signed value into a register and sign-extends it with
	ret
