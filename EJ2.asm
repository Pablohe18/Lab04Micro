.model small
.stack
.data
    num1 db ?
    num2 db ?
    esproducto db "Producto: $"
    escociente db "Cociente: $"
    esresiduo db "Residuo: $"
    residuo db ?
    producto db ?
    cociente db ?

.code
programa:
    mov ax, @data
    mov ds, ax

    ;leer numero1
    xor ax, ax
    mov ah, 01h
    int 21h
    mov num1, al
    sub num1, 30h
    ;leer numero2
    xor ax, ax
    mov ah, 01h
    int 21h
    mov num2, al
    sub num2, 30h
    
    xor ax,ax
    mov al, num1 
    mov ah, num2
    ;comparar
    cmp al, ah
    je igual
    jns mayor1
    js mayor2
    
    igual:
    mov dx, offset esigual
    mov ah, 09h
    int 21h
    jmp finalizar
    mayor1:
    mov dx, offset esmayor1
    mov ah, 09h
    int 21h
    jmp finalizar
    mayor2:
    mov dx, offset esmayor2
    mov ah, 09h
    int 21h
    jmp finalizar

    ;fin del programa
    finalizar:
    
    mov ah, 4ch
    int 21h
end programa