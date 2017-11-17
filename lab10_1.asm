assume cs:code
data segment
db 'Welcome to masm!', 0
data ends

code segment
	start:	mov dh, 8
			mov dl, 3
			mov cl, 2
			mov ax, data
			mov ds, ax
			mov si, 0
			call show_str

			mov ax, 4c00h
			int 21h

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

		s:	mov cl, [si]
			mov ch, 0
			jcxz ok
			mov es:[bx+di], cl
			mov es:[bx+di+1], al
			add di, 2
			inc si
			loop s

		ok:	ret

code ends
end start