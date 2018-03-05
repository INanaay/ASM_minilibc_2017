	[BITS 64]
	global strlen:function
strlen:

  xor   rcx, rcx

loop:

  cmp   [rdi], byte 0  ; rdi = where first argument is, cmpr current byte to Null
  jz    end   ; if byte == 0, jump to end

  inc   rcx            ; inc rcx
  inc   rdi            ;
  jmp   loop   ; go back to loop

end:

  mov   rax, rcx       ; put rcx in rax to return it
  ret
