[org 0x7c00]
	mov bp, 0x9000		;stack base
	mov sp, bp

	mov bx, MSG_REAL_MODE
	call print_string
	call switch_to_pm	;
	jmp $

;;; Need to be careful ordering includes due to [bits 32]
%include "util/print_string.s"
%include "gdt/basic_gdt.s"
%include "gdt/switch_to_pm.s"
%include "util/print_string_pm.s"
	
[bits 32]
BEGIN_PM:
	mov ebx, MSG_PROT_MODE
	;; FIXME: Still can't get print working in protected mode
	call print_string_pm
	jmp $

MSG_REAL_MODE db "Started in 16-bit real mode", 0x20, 0
MSG_PROT_MODE db "Switched to 32-bit protected mode", 0

	times 510 - ($ - $$) db 0
	dw 0xaa55
