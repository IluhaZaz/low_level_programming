section .rodata
inf dq 0x7FF0000000000000
section .text
extern access5
global main
main:
    mov qword [r8], 0
    
    mov rax, [inf]
    mov qword [r8 + 8], rax
    
    pxor xmm0, xmm0
    mov edx, 6312
    
    call access5
    ret