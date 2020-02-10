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
	mov al, 0x0d		; line-feed or CR
	int 0x10		;

loop:
	jmp loop


	
times 510 - ($ - $$) db 0
dw 0xaa55
