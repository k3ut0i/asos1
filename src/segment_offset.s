	mov ah, 0x0e
	mov al, [secret]
	int 0x10

	mov al, "1"
	int 0x10

	mov bx, 0x7c00
	mov ds, bx
	mov al, [secret]
	int 0x10

	mov al, "2"
	int 0x10
	
	mov al, [es:secret]
	int 0x10

	mov al, "3"
	int 0x10
	
	mov bx, 0x7c00
	mov es, bx
	mov al, [es:secret]
	int 0x10

	jmp $
	
secret:
	db "X"

	times 510 - ($ - $$) db 0
	dw 0xaa55
