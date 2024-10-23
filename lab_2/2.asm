%include "io64.inc"

section .rodata
x: dd 0.9

section .text
global main
main:
    movss xmm0, dword [x] ; = x
    mulss xmm0, xmm0; ; *= x^2
    
    mov eax, 1
    cvtsi2ss xmm1, eax
    cvtsi2ss xmm15, eax ;result
    mov eax, 2
    cvtsi2ss xmm2, eax
    mov eax, 3
    cvtsi2ss xmm3, eax
    mov eax, -1
    cvtsi2ss xmm4, eax
    
    mov ecx, 2 ;=n
    
    movss xmm14, xmm1 ;prev_mem
.start:
    
    mulss xmm14, xmm4 ;*=-1
    mulss xmm14, xmm0 ;*=x^2
    
    cvtsi2ss xmm5, ecx ;temp = n
    mulss xmm5, xmm2 ; temp *= 2
    subss xmm5, xmm2; temp-=2
    
    divss xmm14, xmm5; prev/=(2n-2)
    subss xmm5, xmm1; temp-=1
    divss xmm14, xmm5; prev/=(2n-3)
    
    addss xmm15, xmm14 ;res += prev(new)mem
    
    add ecx, 1 ;+=1
    
    cmp ecx, 100
    je .end
    
    jmp .start
.end:
    ret
        
    