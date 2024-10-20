section .text
    global BinarySearch

BinarySearch:
    dec rsi            ; high
    xor r10, r10         ; low
    xor rax, rax        ; mid

_loop:
    cmp r10, rsi        
    jg _error        ; if(low > high) then exit 
    add rax, rsi         ; mid + high
    add rax, r10        ; mid + low
    shr rax, 1        ; mid // 2   div rax, 2
    cmp DWORD [rdi+(rax*4)],  edx     ;cmp [rdi+rax], rdx
    je _success
    jl _less
    jg _greater

_less:
    mov r10, rax
    inc r10
    jmp _loop

_greater:
    mov rsi, rax
    dec rsi
    jmp _loop

_success:
    mov rax, rax
    ret

_error:
    mov rax, -1
    ret    
