	;; GDT
gdt_start:

gdt_null:			; Null descriptor
	dd 0x0			; 32-bit zeros 
	dd 0x0			; 32-bit zeros

	;; CODE SEGMENT
	;; Base: 0x0, limit: 0xfffff,
	;; Type: 1010b (code:1, conforming:0, readable:1, accessed:0)
	;; DescriptorType: 1b, DPL:00b, SegmentPresent: 1b
	;; P+DPL+S+TYPE: 10011010b
	;; Granularity: 1b, D/B: 1b, L: 0b, AVL: 0b
	;; G+D/B+L+AVL+LIMIT_FIRST_BYTE: 11001111b
gdt_code:
	dw 0xffff 		; SegmentLimit 15:00
	dw 0x0			; BaseAddress 15:00
	db 0x0			; BaseAdress 23:16
	db 10011010b		; P+DPL+S+TYPE
	db 11001111b		; G+D/B+L+AVL+LIMIT19:16
	db 0x0			; BaseAddress 31:24

	;; DATA SEGMENT
	;; Base: 0x0, limit: 0xfffff,
	;; Type: 1010b (code:0, expand down:0, writable:1, accessed:0)
	;; DescriptorType: 1b, DPL:00b, SegmentPresent: 1b
	;; P+DPL+S+TYPE: 10011010b
	;; Granularity: 1b, D/B: 1b, L: 0b, AVL: 0b
	;; G+D/B+L+AVL+LIMIT_FIRST_BYTE: 11001111b
gdt_data:
	dw 0xffff 		; SegmentLimit 15:00
	dw 0x0			; BaseAddress 15:00
	db 0x0			; BaseAdress 23:16
	db 10010010b		; P+DPL+S+TYPE
	db 11001111b		; G+D/B+L+AVL+LIMIT19:16
	db 0x0			; BaseAddress 31:24

gdt_end:			;Label so we can calculate gdt size for descriptor
	
gdt_descriptor:
	dw gdt_end - gdt_start - 1 ; One less than the true size, WHY?
	dd gdt_start

	;; Segment descriptor offsets
CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start	

	dd 0xffff
