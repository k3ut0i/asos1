[org 0x7c00]
;;; 	Simple disk read with CHS addressing.
	;; Load DH sectors to ES:BX from drive DL
disk_load:	
	push dx
	mov ah, 0x02 		; BIOS read function
	mov al, dh		; Read dh no. of sectors
	mov ch, 0x00		; cylinder 0
	mov dh, 0x00		; head 0
	mov cl, 0x02		; Start reading from the 2nd sector

	int 0x13		; BIOS interrupt to do the reading to ES:BX

	jc disk_error

	pop dx			; restore dx from stack
	cmp dh, al		; compare al(sectors read) with dh(sectors expected)
	jne disk_error
	ret
	
disk_error:
	mov bx, DISK_ERROR_MSG
	call print_string
	jmp $

%include "print_string.s"
	
DISK_ERROR_MSG:	db "Disk read error!!", 0

	;; times 510 - ($ - $$) db 0
	;; dw 0xaa55
