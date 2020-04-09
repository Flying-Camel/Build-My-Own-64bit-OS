

[ORG 0x00]
[BITS 16]

SECTION .text

; Copy 0x07C0 to CS Segment and move to START lable
jmp 0x07C0:START

START:
    ; Bootloader's start adress set to 0x07C0 and set to DS Segment
    mov ax, 0x07C0
    mov ds, ax
    ; Video memory start Adress set to ES Segment
    mov ax, 0xB800
    mov es, ax

; If you not define segment, Defualt segment is DS segment
; So you must define segment what you want to use like below.
mov byte [es:0x00], 'M'
mov byte [es:0x01], 0x4A

jmp $


times 510 - ($ -$$) db 0x00

db 0x55
db 0xAA

