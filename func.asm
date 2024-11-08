section .text
    global BinarySearch

BinarySearch:
    dec rsi                           ; high
    xor r10, r10                      ; low

_loop:
    xor rax, rax                      ; mid && we zero this register because if we dont rax will        ; we can move this back into BinarySearch
                                      ; keep adding up after iterations messing with the calculations
    cmp r10, rsi
    jg _error                         ; if(low > high) then exit
    add rax, rsi                      ; mid + high                                                      ; we can replace add with mov
    add rax, r10                      ; mid + low
    shr rax, 1                        ; mid // 2   div rax, 2
    cmp DWORD [rdi+(rax*4)],  edx     ; i dont like you
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
    mov rax, rax                      ; unneeded i think
    ret

_error:
    mov rax, -1
    ret
