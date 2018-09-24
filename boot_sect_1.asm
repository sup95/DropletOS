; Infinite loop 
; (equivalent to machine code : 'e9 fd ff' for jump instruction)
loop:
    jmp loop 

times 510-($-$$) db 0   ; Fill with 510 zeros minus the size of the previous code

dw 0xaa55   ; Magic number