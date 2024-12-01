%include "io64.inc"
section .rodata
     a: dd 5.0
    pi: dd 3.141592653589793
    const_2: dd 2.0
section .text
global main
main:
    mov rbp, rsp; for correct debugging
    ;pi/2 - arctg(lna/ln2)
    ;pi 2 / a ln 2 ln / atan -
    
    fld dword[pi]
    fld dword[const_2] ; pi/2
    fdiv
    
    fldln2
    fld dword[a] ; lna
    fyl2x
    
     fldln2
    fld dword[const_2] ; ln2
    fyl2x
    
    fdiv  ; lna/ln2
    
    fld1
    fpatan ; arctang(  (lna/ln2)  /  1)
    
    fsub ; pi/2 - arctang(lna/ln2)
    
    finit
                                    
    xor rax, rax
    ret