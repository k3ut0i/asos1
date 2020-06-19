	%ifndef PRINTSTRING
	%include "util/print_string.s"
	%endif
hex_to_ascii:
	cmp dl, 9
	jle digit
	add dl, 55
	ret
digit:
	add dl, 48
	ret

print_hex:
	;;  TODO: Manipulate chars at HEX_OUT to reflext the value in dx
	mov cl, dh
	shl dx, 4
	shl cx, 4
	shr dl, 4
	shr cl, 4
	and dh, 0x0f
	and dl, 0x0f
	and ch, 0x0f
	and cl, 0x0f
	call hex_to_ascii
	mov [HEX_OUT + 5], dl
	mov dl, dh
	call hex_to_ascii
	mov [HEX_OUT + 4], dl
	mov dl, cl
	call hex_to_ascii
	mov [HEX_OUT + 3], dl
	mov dl, ch
	call hex_to_ascii
	mov [HEX_OUT + 2], dl
	mov bx, HEX_OUT
	call print_string
	ret

	
HEX_OUT:	db '0x0000', 0
