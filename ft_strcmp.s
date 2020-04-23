
		global	_ft_strcmp

		section	.text
_ft_strcmp:							;rsi=s1 rdi=s2
		xor		rdx, rdx			;need dl for cmp
		xor		rcx, rcx				

loop:
		cmp		byte [rsi + rcx], 0	;if s1[i] != \0
		je		LOOP_OVER
		cmp		byte [rdi + rcx], 0
		je		LOOP_OVER
		mov		dl, byte [rsi + rcx];move to tmp
		cmp		byte [rdi + rcx], dl;move to dest
		jne		LOOP_OVER
		inc		rcx
		jmp		loop
		
LOOP_OVER:
		xor		rax, rax			;clear out the return
		mov		al, byte [rsi + rcx];move the s1[i] to the char part of rax
		sub		al, byte [rdi + rcx];al = s1[i] - s2[i]
		jnc		done				;check for the carry flag to fix negative overflow
		neg		al					
		neg		rax

done:
		ret							; return