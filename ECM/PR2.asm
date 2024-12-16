.model small
.stack 100h

.data
    MAX_BUFFER_SIZE EQU 200           ; ???????????? ?????? ??????
    buffer db MAX_BUFFER_SIZE dup(0)  ; ????? ??? ???????? 200 ????????
    msgInput db 'Vvedite stroku (maksimum 200 simvolov): $'
    msgOutput db 0Dh, 0Ah, 'Izmenennaya stroka: $'
    msgEnd db 0Dh, 0Ah, 'Konec vvoda.$'
    msgOverflow db 0Dh, 0Ah, 'Oshibka: perepleneniye bufera.$'
    length db 0                       ; ????? ????????? ??????

.code
main proc
    ; ????????????? ?????????
    mov ax, @data
    mov ds, ax

    ; ????? ????????? ? ?????
    mov dx, offset msgInput
    mov ah, 09h
    int 21h

    ; ???? ?????? ????????
    lea dx, buffer                ; ????????? ?? ?????
    mov byte ptr [buffer], MAX_BUFFER_SIZE ; ???????????? ?????
    mov ah, 0Ah                   ; ??????? ??? ????? ??????
    int 21h

    ; ???????? ???????????? ??????
    mov al, [buffer + 1]           ; ???????? ????? ????????? ?????? (?????? ????)
    cmp al, MAX_BUFFER_SIZE        ; ?????????? ? ???????????? ????????
    ja overflow_error              ; ???? ?????????, ????????? ? ??????
    mov [length], al               ; ????????? ?????

    ; ???????? ????? ?? ??????
    lea si, buffer + 2             ; ????????? ?? ?????? ????????? ?????? (?????????? 2 ?????)
    mov cl, [length]               ; ????????? ????? ?????? ? CL
    xor di, di                     ; ??????? ??? ????? ?????? (di)

replace_loop:
    ; ????????? ?????? ??????
    mov al, [si]                   ; ????? ??????? ??????
    cmp al, 0                       ; ????????? ????? ??????
    je end_replace                  ; ???? ????? ??????, ???????

    ; ?????????, ???????? ?? ??????? ?????? ??????
    cmp al, '0'
    jb copy_char                   ; ???? ?????? '0', ?? ?????
    cmp al, '9'
    ja copy_char                   ; ???? ?????? '9', ?? ?????

    ; ???? ??????? ?????? - ?????, ?????????? ???
    jmp skip_word

copy_char:
    ; ???????? ?????? ? ????? ??????
    mov [buffer + 2 + di], al      ; ???????? ??????
    inc di                          ; ??????????? ????????? ??? ????? ??????

skip_word:
    inc si                          ; ????????? ? ?????????? ???????
    jmp replace_loop                ; ?????????? ? ????? ????????

end_replace:
    ; ????????? ????? ?????? ???????? '$'
    mov byte ptr [buffer + 2 + di], '$' ; ????????? ?????? '$'

    ; ??????? ????????? "Izmenennaya stroka:"
    mov dx, offset msgOutput
    mov ah, 09h                    ; ??????? ??? ?????? ??????
    int 21h

    ; ??????? ?????????? ??????
    lea dx, buffer + 2             ; ????????? ?? ?????? (?????????? 2 ?????)
    mov ah, 09h                    ; ??????? ??? ?????? ??????
    int 21h

    ; ?????????? ?????????
    mov dx, offset msgEnd
    mov ah, 09h
    int 21h

    ; ?????????? ?????????
    mov ax, 4C00h
    int 21h

overflow_error:
    ; ??????? ????????? ?? ?????? ????????????
    mov dx, offset msgOverflow
    mov ah, 09h
    int 21h

    ; ?????????? ?????????
    mov ax, 4C00h
    int 21h

main endp
end main
