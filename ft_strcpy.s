
		global	_ft_strcpy

		section	.text
_ft_strcpy:
		push	rbx
		push	rcx					;store them in case they have anything in them
		mov		rax, rdi			;dst
		mov		rcx, -1				;i = -1
		jmp		loop
loop:
		inc		rcx					;++i
		mov		dl, byte [rsi + rcx];move to tmp
		mov		byte [rax + rcx], dl;move to dest
		cmp		byte [rax + rcx], 0	;done?
		jne		loop
		pop		rcx
		pop		rbx					;pop them back
		ret							; return i