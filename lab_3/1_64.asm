section .bss
state: resq 1

section .rodata
  msg1: db "Enter seed:", 0
  fmt: db "%u", 0
  fmt_output: db "%u", 10, 0
    
extern printf
extern scanf
extern malloc
extern free

section .text
global main
main:
    sub rsp, 40 
    mov rcx, 16 
    call malloc
    add rsp, 40
    ;test rax, rax
    ;jz .cycle_end
    mov [state], rax
    
    sub rsp, 40
    lea rcx, [rel msg1]
    call printf
    add rsp, 40
    
    sub rsp, 40
    lea rcx, [fmt]
    lea rdx, [rsp + 8]
    call scanf
    mov r8d, [rsp + 8]
    add rsp, 40
    
    mov dword [state], 0
    mov dword [state + 4], 0
    mov dword [state + 8], 0
    mov dword [state + 12], r8d
    
    xor r8d, r8d
    xor r13d, r13d
    
.cycle_start:    
    mov r12d, [state + 12]
    mov r10d, [state]
    
    mov ebx, [state + 8]
    mov [state + 12], ebx
    mov ebx, [state + 4]
    mov [state + 8], ebx
    mov [state + 4], r10d
    
    mov r11d, r12d
    shl r11d, 11
    
    xor r12d, r11d
    mov r11d, r12d
    shr r11d, 8
    
    xor r12d, r11d
    xor r12d, r10d
    mov r11d, r10d
    shr r11d, 19
    xor r12d, r11d
    
    mov dword [state], r12d

    sub rsp, 40
    lea rcx, [fmt_output]
    mov rdx, [state]
    call printf
    add rsp, 40
    
    add r13d, 1
    
    cmp r13d, 100
    je .cycle_end
    
    jmp .cycle_start
.cycle_end:
    sub rsp, 40
    mov rcx, [state]
    call free
    add rsp, 40
    ret