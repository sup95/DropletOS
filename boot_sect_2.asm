; boot sector code that prints hello.

; interrupt 0x10 is used for screen related ISR(Interrupt Service Routine).
; 0x0e indicates tele-type mode (print a single character on the screen and advance the cursor, ready for the next character).

; Set value in 'ax' register to then trigger interrupt. (In this case, interrupt 0x10 for screen related ISR.)

mov ah, 0x0e ; set high byte of register ax - i.e. ah, with 0x0e for tele-type mode.

mov al, 'H'
int 0x10
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
int 0x10    ; As 'l' is still on al, so does not need to be moved again.
mov al, 'o'
int 0x10

jmp $   ; Jump to current address = infinite loop

; padding and magic number
times 510 - ($-$$) db 0
dw 0xaa55 