assume cs:code
data segment
db 16 dup(0)
data ends
code segment
	start:	mov ax, data
			mov ss, ax
			mov sp, 16
			mov ax, 584Ah
			mov dx, 0FBA1h
			mov cx, 52h
			call divdw

			mov ax, 4c00h
			int 21h

	divdw:	push ax
			mov ax, dx
			mov dx, 0
			div cx
			mov bx, ax ;final dx
			pop ax
			div cx
			mov cx, dx
			mov dx, bx
			ret

code ends
end start