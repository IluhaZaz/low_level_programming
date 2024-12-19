global _start

section .text

_start:
    mov rbp, rsp
    sub rsp, 32
    and rsp, 32
    mov dword [rbp-16], 0x65636341
    mov dword [rbp-12], 0x67207373
    mov dword [rbp-8], 0x746E6172
    mov dword [rbp-4], 0x20216465 
    mov rax, 1
    mov rdi, 1
    lea rsi, [rbp-16]
    mov rdx, 15
    syscall
    mov rax, 60
    xor rdi, rdi
    syscall