
		global	_ft_strcmp

		section	.text
_ft_strcmp:							;rsi=s1 rdi=s2
		xor		rdx, rdx			;need dl for cmp
		xor		rcx, rcx				
		push	rdi
		push	rsi
		repe	cmpsb
		
		xor		rax, rax			;clear out the return
		mov		r15b, [rsi]
		mov		r14b, [rdi]				;move the s1[i] to the char part of rax
		sub		r15b, r14b			;al = s1[i] - s2[i]
		movsx	rax, r15b
		neg		rax
		
done:
		pop 	rsi
		pop		rdi
		ret							; return
