[org 0x7c00]
	mov dx, 0x56ae
	call print_hex
	jmp $

%include "util/print_hex.s"

	times 510 - ($ - $$) db 0
	dw 0xaa55
