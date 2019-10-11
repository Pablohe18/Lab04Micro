.model small
.stack
.data
    num db ?
    espar db " El numero es par $"
    noespar db " El numero no es par $"
    residuo db ?

.code
programa:
    mov ax, @data
    mov ds, ax

    ;Leer el Numero
    xor ax, ax
    mov ah, 01h
    int 21h
    mov num, al
    sub num, 30h
    
    ;hacer las comparaciones
    xor ax,ax
    mov al, num
    mov cl, 2
    div cl
    mov residuo, ah
    ;hacer las comparaciones
    cmp residuo, 0
    jz PAR
    jnz IMPAR
    PAR:
    mov dx, offset espar
    mov ah, 09h
    int 21h
    IMPAR:
    mov dx, offset noespar
    mov ah, 09h
    int 21h
    jmp finalizar
    mov dx, offset noespar
    mov ah, 09h
    int 21h
    finalizar:
    
    mov ah, 4ch
    int 21h
end programa