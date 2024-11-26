section .data
first_mul: dd 1, 1
structure: dq 4, 0
arr: dd 7F800000h, 0., 7FFFFFFFh, 0.

section .text
global main
extern access5
main:
sub rsp, 56

lea rcx, [first_mul]
lea rdx, [structure]

movdqu xmm0, [arr]
movups [rsp+32], xmm0
lea rax, [rsp+32];arr adress
mov [rdx+8], rax

call access5
add rsp, 56
ret