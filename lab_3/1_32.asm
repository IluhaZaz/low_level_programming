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

    push ebp
    mov ebp, esp
    
    push msg1
    call printf
    add esp, 4
    
    sub esp, 8
    lea eax, [rel fmt]
    mov [esp], eax
    lea eax, [ebp -4]
    mov [esp+4], eax
    call scanf
    add esp, 8
    mov edi, [ebp -4]
    
    mov eax, 16
    push eax
    call malloc
    add esp, 4
    
    mov ebx, eax
    
    mov dword [ebx], 0
    mov dword [ebx + 4], 0
    mov dword [ebx + 8], 0
    mov dword [ebx + 12], edi
    
    xor edi, edi

.cycle_start: 
    mov esi, [ebx + 12]
    mov edx, [ebx]
    
    mov eax, [ebx + 8]
    mov [ebx + 12], eax
    mov eax, [ebx + 4]
    mov [ebx + 8], eax
    mov [ebx + 4], edx
    
    mov eax, esi
    shl eax, 11
    
    xor esi, eax
    mov eax, esi
    shr eax, 8
    
    xor esi, eax
    xor esi, edx
    mov eax, edx
    shr eax, 19
    xor esi, eax
    
    mov [ebx], esi
    
    push dword [ebx]
    push fmt_output
    call printf
    add esp, 8
    
    add edi, 1
    
    cmp edi, 100
    jge .cycle_end
    
    jmp .cycle_start
    
.cycle_end:
    push ebx
    call free
    add esp, 4
    
    leave
    ret