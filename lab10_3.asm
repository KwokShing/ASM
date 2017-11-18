assume cs:code
data segment
db 10 dup(0)
data ends

code segment
	start:	mov ax, 12666
			mov bx, data
			mov ds, bx
			mov si, 1
			mov di, 0
			call dtoc

			mov dh, 8
			mov dl, 3
			mov cl, 2
			call show_str

			mov ax, 4c00h
			int 21h

	dtoc:	mov dx, 0
			mov bx, 10
			div bx
			mov cx, ax
			jcxz reverse
			inc si
			add dx, 30h
			push dx
			jmp short dtoc
reverse:	add dx, 30h
			push dx
			mov cx, si
rev:		pop ax
			mov [di], al
			inc di
			loop rev
			mov si, 0
			ret

show_str:	mov ax, 0b800h
			mov es, ax
			sub dh, 1
			mov al, 0a0h
			mul dh
			mov bx, ax
			sub dl, 1
			mov al, 2
			mul dl
			mov di, ax
			mov al, cl

	print:	mov cl, [si]
			mov ch, 0
			jcxz ok
			mov es:[bx+di], cl
			mov es:[bx+di+1], al
			add di, 2
			inc si
			loop print

		ok:	ret

code ends
end start