%include "io64.inc"

section .bss
    arr resq 1000
    
section .text
    global main
    
main:
    mov rbp, rsp; for correct debugging

    GET_DEC 8, r8
;start input elements    
    mov rbx, 0

elements_loop:
    cmp rbx, r8
    jge elements_end
    GET_DEC 8, [arr + rbx*8]
    inc rbx
    jmp elements_loop
elements_end:
;end input elements

;bb_sort_start
;rbx = i
;rcx = j
;r8 = array_size
;r9 = array_size - 1
;r10 = arr_size - i - 1
;r11 = arr[j]
;r12 = arr[j + 1]
;r14 = j+1
;r13 = temp
    mov rbx, 0
bbsort_start:
    mov r9, r8
    sub r9, 1
    cmp rbx, r9
    jge bbsort_end
    mov rcx, 0
iter_bbsort_start:
    mov r10, r9
    sub r10, rbx
    cmp rcx, r10
    jge iter_bbsort_end
    mov r11, [arr + 8*rcx]
    mov r14, rcx
    imul r14, 8
    mov r12, [arr + r14 + 8]
    cmp r11, r12
    jle comp_end
    mov r13, r11
    mov [arr + 8*rcx], r12
    mov [arr + 8*rcx+8], r13
comp_end:
    inc rcx
    jmp iter_bbsort_start
iter_bbsort_end:
    inc rbx
    jmp bbsort_start
bbsort_end:
;bb_sort_end

;start output elements
    mov rbx, 0
print_start:
    cmp rbx, r8
    jge print_end
    PRINT_DEC 8, [arr + rbx*8]
    PRINT_STRING ' '
    inc rbx
    jmp print_start
print_end:
;end output elements
    ret