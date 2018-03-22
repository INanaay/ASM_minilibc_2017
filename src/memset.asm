	[BITS 64]
	global memset:function
memset:
	xor rcx, rcx
loop:
	cmp rcx, rdx
	jz end
	mov [rdi], sil 		;sil 8 lower bits of rsi register
	inc rcx
	inc rdi
	jmp loop
end:
	ret
