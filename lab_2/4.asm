%include "io64.inc"

section .rodata
x: dd 2.1
y: dd 0.47619
a: dd 8.1
e: dd 2.71828
epsilon: dd 0.000001
section .bss

section .text
global main
main:

    fld1
    fld1
    fadd
    fld dword [a]
    fmul
    ;2a
    
    fld dword[e]
    
    FYL2X ;вычисляем показатель
    FLD1 ;загружаем +1.0 в стек
    FLD ST1 ;дублируем показатель в стек
    FPREM ;получаем дробную часть
    F2XM1 ;возводим в дробную часть показателя
    FADD ;прибавляем 1 из стека
    FSCALE ;возводим в целую часть и умножаем
    FSTP ST1 ;
    
    ; e^2a
    
    fld1 
    fsub
    
    fld st0
    
    fld1 
    fadd
    fld1 
    fadd
    
    fdiv
    
    fld dword[x]
    fdiv
    
    fld dword[y]
    
    fcomi
    jnb .y_less
    jmp .y_more
    
.y_less:
    fsub
    fchs
.y_more:
    fsub
    
    fld dword [epsilon]
    fcomi
    jnb .yes
    jmp .no

.yes:
    mov eax, 1
    PRINT_DEC 4, eax
    ret
.no:
    mov eax, 0
    PRINT_DEC 4, eax
    ret
    
    
    
    