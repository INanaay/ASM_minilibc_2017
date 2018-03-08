	[BITS 64]
	global rindex:function
rindex:
	xor rcx, rcx
len:
	cmp [rdi], byte 0
	jz get_char

	inc rdi
	inc rcx
	jmp len
get_char:
	cmp rcx, 0
	je ko
	cmp [rdi], sil
	je end

	sub rdi, 1
	sub rcx, 1
	jmp get_char
ko:
	mov rax, 0
	ret
end:
	mov rax, rdi
	ret
