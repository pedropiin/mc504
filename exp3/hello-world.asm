section .text

global _start

_start: 
    mov ecx, msg
    mov edx, len

    call write

    mov eax, 1
    int 0x80
write:
    mov eax, 4
    mov ebx, 1
    int 0x80

    ret

section .data

msg db "Hello world!"
len equ $-msg
