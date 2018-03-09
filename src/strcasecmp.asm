	[BITS 64]
	global strcasecmp:function

strcasecmp:
	mov rdx, rdi 		; so i dont change adress
	mov rcx, rsi
	jmp first

first_to_lower:
	add r8b, 32
	jmp second

second_to_lower:
	add r9b, 32
	jmp comp


first:
	mov r8b, [rdx]
	cmp r8b, 65
	jl second  		;on check le caractere du 2e
	; jump if lower
	cmp r8b, 90
	jl first_to_lower
	jmp second

second:
	mov r9b, [rcx]
	cmp r9b, 65
	jl comp
	cmp r9b, 90
	jl second_to_lower
	jmp comp

comp:
	cmp r8b, r9b
	jne end
	cmp r9b, byte 0
	je end
	cmp r8b, byte 0
	je end

	inc rcx
	inc rdx
	jmp first
end:
	sub r8b, r9b
	movsx rax, r8b
	ret
