	[BITS 64]
	global strncmp:function
strncmp:
	xor rcx, rcx
loop:
	mov r8b, [rdi + rcx]
	cmp r8b, byte 0
	je end
	cmp [rsi + rcx], byte 0
	je end
	cmp r8b, [rsi + rcx]
	jne end
	cmp rcx, rdx
	je end
	inc rcx
	jmp loop
end:
	sub r8b, [rsi + rcx]
	movsx rax, r8b		;movxs = extends r8B to 64b
	ret
