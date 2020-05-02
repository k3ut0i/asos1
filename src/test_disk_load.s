;;; Read N sectors following the boot sector from a specific device.
	[org 0x7c00]
	mov [BOOT_DRIVE], dl 	; BIOS stores boot drive in dl
	mov bp, 0x8000		; Set stack somewhere safe
	mov sp, bp

	mov bx, 0x9000 		; load 5 sectors to es:bx - 0x0000:0x9000
	mov dh, 0x05
	mov dl, [BOOT_DRIVE]
	call disk_load

	mov dx, [0x9000] 	; first loaded word - expected to be 'dada'
	call print_hex

	mov dx, [0x9000 + 512]
	call print_hex		; first word in 2nd sector -expected to be 'face'

	jmp $

%include "disk_load.s"
%include "print_hex.s"

BOOT_DRIVE:	db 0
	times 510 - ($ - $$) db 0
	dw 0xaa55

	times 256 dw 0xdada
	times 256 dw 0xface
