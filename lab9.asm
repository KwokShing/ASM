assume cs:codesg
data segment
db 'welcome to masm!'
db 00000010b, 00100100b, 01110001b
data ends
codesg segment
	start:	mov ax, data
			mov ds, ax
			mov ax, 0b800h
			mov es, ax
			mov bx, 16
			mov cx, 3
			mov si, 1664

		s:	push cx
			;mov si, 0
			mov cx, 16
			mov bp, 0

	line:	mov al, [bp]
			mov ah, [bx]
			mov es:[si], ax
			add si, 2
			inc bp
			loop line

			inc bx
			pop cx
			add si, 80h
			loop s	

			add ax, 4c00h
			int 21h

codesg ends
end start