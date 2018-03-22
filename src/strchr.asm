	[BITS 64]
	global strchr:function
strchr:
	cmp	[rdi], byte 0
	jz	return_null
	cmp 	[rdi], sil
	jz	end

	inc rdi
	jmp strchr
return_null:
	mov rax, 0
	ret
end:
	mov rax, rdi
	ret
