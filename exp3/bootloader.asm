/*
EXP 3
André Santos Rocha - 235887 - Turma A
Pedro da Rosa Pinheiro - 231081 - Turma A
*/

; --- Setting address for BIOS to load MBR correctly---
org 0x7c00

; --- Setting Real Mode ---
bits 16

global _start

_start:
    mov cx, msg_boot
    mov dx, len_msg_boot
    
    ; --- Calling write to print the "hello" message
    call write

    ; --- Padding the boot sector ---
    times 510 - ($ - $$) db 0

    ; --- Signing the bootloader ---
    dw 0xAA55 

    jmp $

write:
    mov ax, 1
    mov bx, 1
    int 0x80

    ret


section .data
; --- Messages for boot response ---
msg_boot db "Hello World! System booted successfully!"
len_msg_boot equ $-msg_boot
