%ifndef SWITCH_TO_PM
%define SWITCH_TO_PM
DBG_STRING db "In Switching to PM prog", 0x20, 0
%include "util/print_string.s"	
switch_to_pm:
	nop			;TO prevent data cloberrring
	nop
	nop
	nop
	nop
	nop
print_dbg:
	mov bx, DBG_STRING
	call print_string

	cli
	lgdt [gdt_descriptor]
	mov eax, cr0
	or eax, 0x1
	mov cr0, eax
	jmp CODE_SEG:init_pm

[bits 32]
init_pm:
	mov ax, DATA_SEG
	mov ds, ax
	mov ss, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	mov ebp, 0x90000
	mov esp, ebp
	call BEGIN_PM
%endif ;; SWITCH_TO_PM
