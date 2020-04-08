

; Address of Start code is set by 0x00
; Set 16bit below code
[ORG 0x00]
[BITS 16]

; Define Text Section
SECTION .text

; Infinity loop here
; Aka while(1) 
jmp $

; $ - Current line address
; $$ - current Section address (.text)
; $ - $$ - offset of current section
; 510 - ($ -$$) mean ... Current adress to 510
; db 0x00 - declare 1byte and value is 0x00
; time - repeat
; Therefor... below code mean.. Current Adress to 510 adress fill with 0x00
times 510 - ($ -$$) db 0x00

; Address 511 and 512 value is 0x55 and 0xAA
; This means This is Bootloader.
db 0x55
db 0xAA
