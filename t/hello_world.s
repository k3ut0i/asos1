[org 0x7c00]
	mov bx, GREETING
	call print_string
	mov bx, FAREWELL
	call print_string
	jmp $

%include "util/print_string.s"
	
GREETING:
	db 'Booting ASOS1', 0 	; Null terminated string
FAREWELL:
	db 'Completed Booting ASOS1', 0

	times 510 - ($ - $$) db 0
	dw 0xaa55
