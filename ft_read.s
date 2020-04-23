		global _ft_read
		extern ___error

		section .text
; int ft_read(int fd, const void *buf, size_t size); fd = rdi, buf = rsi, size = rdx
_ft_read:
		cmp  rdx, 0
		je   FT_READ_NO_SIZE
		cmp  dil, 0
		jl   FT_READ_ERROR		; fd < 0
		cmp  sil, 0
		je   FT_READ_ERROR		; buf == NULL

		push rdx
		push rsi
		xor  rsi, rsi
		mov  esi, 1				;F_GETFD for fcntl call
		mov  rax, 0x200005c		;fcntl call, sets errno appropriately
		syscall
		pop  rsi
		pop  rdx
		cmp  eax, 0
		jne  FT_READ_ERROR		;should've returned 0 and this wouldn't have happened

		mov  rax, 0x2000004		;everything besides these 3 lines is error handling
		syscall
		cmp rax, 0
		jl FT_WRITE_ERROR
		ret
FT_READ_ERROR:
		;neg  rax
		mov  r15, rax
		call  ___error
		mov [rax], r15
		mov  rax, -1
		ret
FT_READ_NO_SIZE:
		mov  rax, 0
		ret