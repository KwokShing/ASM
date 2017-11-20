assume cs:codesg
datasg segment
	db "Beginner's All-purpose Symbolic Instruction Code.", 0
datasg ends

codesg segment
	start:	mov ax, datasg
			mov ds, ax
			mov si, 0
			call letterc

			mov ax, 4c00h
			int 21h
	letterc:mov cl, [si]
			mov ch, 0
			jcxz ok
			cmp cl, 'a'
			jb	next
			cmp cl, 'z'
			ja	next
			sub cl, 32
			mov [si], cl

	next:	inc si
			loop letterc

	ok:		ret
codesg ends
end start