	[BITS 64]
	global strchr:function
strchr:
	cmp	[rdi], byte 0
	jz	end
	cmp 	[rdi], sil
	jz	end

	inc rdi
	jmp strchr
end:
	mov rax, rdi
	ret
