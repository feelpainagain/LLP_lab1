%include "io64.inc"
section .rodata
    x: dd 0.5
    one: dd 1.0
section .text
global main
main:
    mov rbp, rsp; for correct debugging
    movss xmm0, dword[one] ; result
    movss xmm1, dword[x]; radiants (numerator_grow x2)
    mov r8, 0 ; index
    movss xmm2, xmm1
    mulss xmm2, xmm2; numerator
    
    mov rax, __float32__(2.0)
    movq xmm3, rax ; denominator
    movq xmm4, xmm3 ; denominator_grow
    
    mov rax, __float32__(-1.0)
    movq xmm5, rax ; sighn
    movq xmm6, rax; sighn changes
teilor_start:
    cmp r8, 5
    jge teilor_end
    
    movss xmm7, xmm2
    divss xmm7, xmm3
    mulss xmm7, xmm5
    
    addss xmm0, xmm7
    
    mulss xmm2, xmm1
    mulss xmm2, xmm1
    
    addss xmm4, dword[one]
    mulss xmm3, xmm4
    addss xmm4, dword[one]
    mulss xmm3, xmm4
    
    mulss xmm5, xmm6
    
    add r8, 1
    jmp teilor_start
teilor_end:
    xor rax, rax
    ret