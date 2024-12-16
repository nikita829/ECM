model small
.stack 100h
.data
.code
start:
    mov ax, 13h
    int 10h
    mov ax, 0A000h
    mov es, ax
    mov di, 6850
    mov al, 7
    mov cx, 50
    rep stosb
    mov di, 6900
    mov cx, 10
Line:
    mov al, 7
    stosb
    stosb
    add di, 319
    loop Line
    mov di, 6850
    mov cx, 10
Line2:
    mov al, 7
    stosb
    stosb
    add di, 317
    loop Line2
    mov di, 9469
    mov cx, 18
Line3:
    mov al, 7
    stosb
    stosb
    add di, 316
    loop Line3
    mov di, 9401
    mov cx, 18
Line4:
    mov al, 7
    stosb
    stosb
    add di, 320
    loop Line4
    mov di, 20930
    mov al, 7
    mov cx, 50
    rep stosb
    mov di, 6900
    mov cx, 45
Line5:
    mov al, 7
    stosb
    stosb
    add di, 318
    loop Line5
    mov di, 6850
    mov cx, 45
Line6:
    mov al, 7
    stosb
    stosb
    add di, 316
    add di, 2
    loop Line6
    mov di, 27270
    mov cx, 43
Line7:
    mov al, 7
    stosb
    stosb
    add di, 322
    sub di, 2
    loop Line7
    mov di, 27440
    mov cx, 43
Line8:
    mov al, 7
    stosb
    stosb
    add di, 316
    loop Line8
    mov di, 15195
    mov cx, 82
Line9:
    mov al, 7
    stosb
    stosb
    add di, 322
    sub di, 4
    loop Line9
    mov di, 10360
    mov cx, 52
Line10:
    mov al, 7
    stosb
    stosb
    add di, 317
    sub di, 0
    loop Line10
    mov di, 10429
    mov cx, 52
Line11:
    mov al, 7
    stosb
    stosb
    add di, 319
    sub di, 0
    loop Line11
    mov di, 21250
    mov cx, 21
Line12:
    mov al, 7
    stosb
    stosb
    add di, 315
    loop Line12
    mov di, 21300
    mov cx, 21
Line13:
    mov al, 7
    stosb
    stosb
    add di, 321
    loop Line13
    xor ax, ax
    int 16h
    mov ax, 3
    int 10h
    mov ax, 4C00h
    int 21h
end start
