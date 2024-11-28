section .rodata
inf dq 0x7FF0000000000000
section .text
extern access5
global main
main:
    sub rsp, 32+8
    mov qword [r8], 0
    
    mov rax, [inf]
    mov qword [r8 + 8], rax
    
    pxor xmm0, xmm0
    mov edx, 6312
    
    call access5
    add rsp,32+8
    ret
;C:\Users\Acer\Documents\low_level_prog\lab_3\medium.obj $PROGRAM.OBJ$ $MACRO.OBJ$ -g -o $PROGRAM$ -m64