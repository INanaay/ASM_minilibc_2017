	[BITS 64]
	global memcpy:function
memcpy:
	xor rcx, rcx
loop:
	cmp rcx, rdx 		;rdx 3rd parameter
	jz end
	mov r8b, [rsi + rcx] 	;8bits  = 1 octet (byte)
	mov [rdi + rcx], r8b
	inc rcx
	jmp loop
end:
	ret
