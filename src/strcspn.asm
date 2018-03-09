	[BITS 64]
	global strcspn:function
	
strcspn:
	xor r8, r8
	jmp loop
loop:
	cmp [rdi + r8], byte 0
	je end

	mov rcx, [rdi + r8]
	jmp check_second_string

check_second_string:
	mov r9, 0
	jmp second_loop

second_loop:
	cmp [rsi + r9], byte 0
	jz next_char

	mov al, [rdi + r8]
	cmp al, [rsi + r9]
	je end
	inc r9
	jmp second_loop
next_char:
	inc r8
	jmp loop
end:
	mov rax, r8
	ret
