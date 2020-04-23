		extern _ft_strlen
		extern _ft_strcpy
		extern malloc

		global _ft_strdup

		section .text
; char *ft_strdup(const char *str);
_ft_strdup:
		push	rdi			; save rdi because it will be overwrite for malloc

		call	_ft_strlen	; rdi is still == str
		inc		rax			; len++ for '\0'

		mov		rdi, rax	; size to malloc
		call	malloc		;malloc return string
		cmp		rax, 0
		je		FT_STRDUP_ERROR

		pop		rsi          ; original str as src for strcpy call
		mov		rdi, rax     ; allocated as dest
		call	_ft_strcpy
		ret
FT_STRDUP_ERROR:
		xor		rax, rax	; return null on failed malloc
		ret