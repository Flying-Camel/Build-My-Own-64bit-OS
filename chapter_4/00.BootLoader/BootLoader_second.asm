

[ORG 0x00]
[BITS 16]

SECTION .text

; Copy 0xB800 Adress at ax Register.
; copy AX Reg's Value to DS. 
; After This code, All access data instruction is used as reference adress.
mov ax, 0xB800
mov ds, ax

; [~] used in Assm when reference [~] memory value 
; "M" Is first print character and 0x4A is property of "M"
; 4 is read background color and A is light green font color.
mov byte [0x00], 'M'
mov byte [0x01], 0x4A

jmp $


times 510 - ($ -$$) db 0x00

db 0x55
db 0xAA

