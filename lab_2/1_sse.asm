%include "io64.inc"

section .rodata
x: dd 5.1244

section .text
global main

main:
    movss xmm0, dword [x]
    roundss xmm1, xmm0, 2
    cvtss2si eax, xmm1
    
    PRINT_DEC 4, eax
    
    xor eax, eax
    ret