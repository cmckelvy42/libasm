		global _ft_write
		extern ___error
		section .text
; int ft_write(int fd, const void *buf, size_t size); fd = rdi, buf = rsi, size = rdx
_ft_write:
		xor  rax, rax
		cmp  rdx, 0
		je   FT_WRITE_NO_SIZE
		cmp  rdi, 0
		jl   FT_WRITE_ERROR		; fd < 0
		cmp  rsi, 0
		je   FT_WRITE_NULLPO		; buf == NULL

		push rdx
		push rsi
		xor  rsi, rsi
		mov  esi, 1				;F_GETFD for fcntl call
		mov  rax, 0x200005c		;fcntl call, sets errno appropriately
		syscall
		pop  rsi
		pop  rdx
		cmp  eax, 0
		jne  FT_WRITE_ERROR		;should've returned 0 and this wouldn't have happened

		mov  rax, 0x2000004		;everything besides these 3 lines is error handling
		syscall
		ret
FT_WRITE_ERROR:
		mov  r15, rax
		call ___error
		mov [rax], r15
		mov  rax, -1
		ret
FT_WRITE_NO_SIZE:
		mov  r15, rax
		call ___error
		mov  [rax], r15
		mov  rax, 0
		ret
FT_WRITE_NULLPO:				;gah
		mov  rax, 14
		jmp  FT_WRITE_ERROR
