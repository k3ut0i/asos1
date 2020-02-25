[org 0x7c00]
	mov ah, 0x0e 			; int 10/ah = 0eh => scrolling type BIOS routine
	mov al, 'H'
	int 0x10
	mov al, 'e'
	int 0x10
	mov al, 'l'
	int 0x10
	mov al, 'l'
	int 0x10
	mov al, 'o'
	int 0x10
	and dx, 0x00
	mov al, [STRING]
	mov bx, 0x0
string_loop:		
	cmp al, 0x00
	je end_loop
	int 0x10
	mov al, '|'
	int 0x10
	add bx, 1
	mov al, [STRING + bx]
	jmp string_loop
end_loop:	
	mov al, 0x0d		; line-feed or CR
	int 0x10		;

loop:
	jmp loop

STRING:
	db '123456789', 0
	
times 510 - ($ - $$) db 0
dw 0xaa55
