%include "io64.inc"

section .rodata
a: dd 2.1
b: dd 4.2

section .bss

section .text
global main
main:
    fld dword[b] ;b
    
    fld1 
    fld1
    fadd
    
    FYL2X ;вычисляем показатель
    FLD1 ;загружаем +1.0 в стек
    FLD ST1 ;дублируем показатель в стек
    FPREM ;получаем дробную часть
    F2XM1 ;возводим в дробную часть показателя
    FADD ;прибавляем 1 из стека
    FSCALE ;возводим в целую часть и умножаем
    FSTP ST1 ;
    
    fld1
    fpatan
    fstp st1
    
    fld dword[a]
    fsub
    ret
        