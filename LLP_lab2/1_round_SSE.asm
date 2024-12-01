%include "io64.inc"
section .rodata
    number: dd 14.33

section .bss
    result: resd 1

section .text
global main
main:
    mov rbp, rsp; for correct debugging
    movss xmm0, dword[number]
    roundss xmm0, xmm0, 0x2
    
    cvttss2si eax, xmm0
    
    mov [result], eax
    
    PRINT_DEC 4, result
    
    xor rax, rax
    ret