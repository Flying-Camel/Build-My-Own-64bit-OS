

[ORG 0x00]
[BITS 16]

SECTION .text

jmp 0x07C0:START

START:
	mov ax, 0x7C0
	mov ds, ax
    ; 0xB800 is Video Memory
	mov ax, 0xB800
	mov es, ax

; Initialize si Register. SI register is original string index register.
	mov si, 0


; Clear Monitor.
.SCREEN_CLEAR_LOOP:

	mov byte[ es: si ], 0
	mov byte[ es: si + 1 ], 0x0A

	add si,2

	cmp si, 80*25*2
	jl .SCREEN_CLEAR_LOOP

; Initialize SI and DI register 
	mov si, 0
	mov di, 0


.MESSAGE_LOOP:
    ; CL register is CX register's lower 4bits.
	mov cl, byte[ si + MESSAGE_BOOTSTART ]
	
    ; If coypied value is '0' it means end of string. ( null )
	cmp cl, 0
	je .MESSAGE_END

	mov byte[ es: di ], cl

    ; In Previous lable filled monitor with black background and green font color.
    ; MESSAGE_BOOTSTART address + 1. 
	add si, 1 
	add di, 2

	jmp .MESSAGE_LOOP

.MESSAGE_END:
	jmp $


MESSAGE_BOOTSTART:
	db 'MINT64 OS Boot Loader Starting Now...', 0


times 510 - ( $ -$$ )	db	0x00

db 0x55
db 0xAA
