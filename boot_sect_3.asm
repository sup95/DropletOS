; A simple boot sector program that demonstrates addressing.

; The line below tells the assembler about memory offset to be calculated.
; 0x7c00 is where the boot sector is loaded.
; Comment and uncomment the line below to play with and analyze different outputs. 
; [org 0x7c00]

mov ah, 0x0e

; First attempt
mov al, the_secret
int 0x10

; Second attempt
mov al, [the_secret]
int 0x10 

; Third attempt
mov bx, the_secret
add bx, 0x7c00
mov al, [bx]
int 0x10 

; Fourth attempt
mov al, [0x7c1b]
int 0x10 

the_secret:
    db "X"


jmp $   ; Jump to current address = infinite loop

; padding and magic number
times 510 - ($-$$) db 0
dw 0xaa55 