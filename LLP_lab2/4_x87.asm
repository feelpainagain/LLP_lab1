%include "io64.inc"
section .rodata
    x: dd 1.0
    y: dd 2.0
    a: dd 3.0
section .text
global main
main:
    mov rbp, rsp; for correct debugging
    ;y>sinh(x) - a
    ;sinh(x) = (e^x - e^(-x))/2
    ;e^x = 2^(x*log2(e))
    
    fld dword[x] ; st0 = x
    
    fldl2e ; log2e
    
    fmul; x*log2e
    
    f2xm1 ; 2^
    fld1
    fadd
    
    fld1
    fdiv st0, st1 ; e^(-x) = 1/e^x
    
    fsub st1, st0
    
    fld st1
    
    fld1
    fadd st0, st0
    
    fdiv st1, st0
    
    fld st1
    
    fld dword[a]
    
    fsub st1, st0
    
    fld st1
    fld dword[y]
    
    fcom
    jg true_message
    jle false_message
    true_message:
    PRINT_STRING "TRUE"
    jmp end
    false_message:
    PRINT_STRING "FALSE"
    jmp end
    end:

    finit
    ret