	[BITS 64]
	global memset:function
memset:
	xor rcx, rcx
loop:
	cmp rcx, rdx
	jz end
	mov [rdi], sil
	inc rcx
	jmp loop
end:
	ret
