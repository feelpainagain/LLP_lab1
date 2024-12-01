%include "io64.inc"
section .rodata
    number: dd 14.33

section .bss
    result: resd 1

section .text
global main
main:
    fld dword[number]

    sub rsp, 8
    fstsw [rsp]
    mov al, [rsp+1]
    and al, 0xF3 ; 0b11110011
    or al, 8 ; 1000
    mov [rsp+1], al
    fldcw [rsp]
    add rsp, 8
    
    fist dword[result]
    mov eax, [result]
    PRINT_DEC 4, eax
    
    xor rax, rax
    ret