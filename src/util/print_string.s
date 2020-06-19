%ifndef PRINTSTRING
%define PRINTSTRING
print_string:
	push ax
	push cx
	mov ah, 0x0e
loop:	mov cl, byte [bx]
	cmp cl, 0x00
	je end_loop
	mov al, [bx]
	add bx, 1
	int 0x10
	jmp loop
end_loop:
	pop ax
	ret
	
%endif
