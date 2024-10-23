%include "io64.inc"

section .rodata
x: dd 10.2321

section .bss
result: resd 1

section .text
global main

set_round_upward:
 sub rsp, 8       ; выделить место в стеке
 fstcw [rsp]       ; сохранить управляющее слово
 mov ax, [rsp]      ; получить управляющее слово
 and al, [rsp + 1]
 and al, 0xF3
 or al, 11
 mov [rsp + 1], al      ; сохранить данные обратно
 fldcw [rsp]       ; загрузить новое управляющее слово
 add rsp, 8       ; освободить выделенное место в стеке
 ret

main:
 GET_STRING x, 64     ; считка десятичного входного значения
 mov eax, [x]
 call set_round_upward  ; изменить режим округления на округление вверх
 
 fld dword[x]
 fist dword[result]   ; округление до целого числа по установленному режиму
 
 PRINT_DEC 4, [result]  ; вывод результата округления вверх
 
 ret
