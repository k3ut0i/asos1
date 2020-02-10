%include "print_string.s"
	mov bx, greeting
	call print_string
	mov bx, farewell
	call print_string
	jmp $
	
greeting:
	db 'Booting ASOS1', 0 	; Null terminated string
farewell:
	db 'Completed Booting ASOS1', 0

	times 510 - ($ - $$) db 0
	dw 0xaa55
