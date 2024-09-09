; --- Setting address for BIOS to load MBR correctly---
org 0x7c00

; --- Setting Real Mode ---
bits 16

global _start

_start:
    mov ch, msg_boot
    mov dh, len_msg_boot
    
    call write

    jmp $

write:
    mov ah, 4
    mov bh, 1
    int 0x80

    ret

; --- Messages for boot response ---
msg_boot db "Hello World! System booted successfully!"
len_msg_boot equ $-msg_boot

; --- Padding the boot sector ---
times 510 - ($ - $$) db 0
dw 0xAA55 