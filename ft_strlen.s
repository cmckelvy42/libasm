
		global	ft_strlen

		section	.text
ft_strlen:
		xor		rax, rax			; i = 0
		mov		rax, -1				; condenses things later
		jmp		loop
loop:
		inc		rax					; i++
		cmp		BYTE [rdi + rax], 0	; str[i] == \0
		jne		loop				; if not equal, do again
		ret							; return i