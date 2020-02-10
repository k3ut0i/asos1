[org 0x7c00]
	mov ah, 0x0e
	mov cl, 0x30

	call print_counter
	mov al, the_secret
	int 0x10

	call print_counter
	mov al, [the_secret]
	int 0x10

	call print_counter
	mov bx, the_secret
	add bx, 0x7c00
	mov al, [bx]
	int 0x10

	call print_counter
	mov ax, 0x7c1d
	int 0x10

	jmp $

print_counter:
	mov al, cl
	add cl, 1
	int 0x10
	ret

the_secret:
	db 'X'

	times 510 - ($ - $$) db 0
	dw 0xaa55
	
