	[BITS 64]
	global strcmp:function
strcmp:
	xor rcx, rcx
loop:
	mov r8b, [rdi + rcx]
	cmp r8b, byte 0
	jz end 			;jz = jump if zero
	cmp [rsi + rcx], byte 0
	jz end
	cmp r8b, [rsi + rcx]
	jne end 		; jne = jump if condiiton is met 

	inc rcx
	jmp loop
end:
	sub r8b, [rsi + rcx]
	movsx rax, r8b
	ret
