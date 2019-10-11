.model small
.stack
.data
    num1 db ?
    num2 db ?
    esproducto db 10,13,"Producto: $"
    escociente db 10,13,"Cociente: $"
    esresiduo db 10,13,"Residuo: $"
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
    ;contador
    mov bl, 1h
    SUMAR:
    add al, num1 
    inc bl
    cmp bl, num2 
    je imprimirsuma
    jmp sumar

    IMPRIMIRSUMA:
    mov producto, al
    add producto, 30h
    mov dx, offset esproducto
    mov ah, 09h
    int 21h
    xor ax,ax
    xor dx,dx
    
    mov dl, producto
    xor ax, ax
    mov ah, 02h
    int 21h 
   
    ;limpio registros
    xor dx, dx
    xor bx, bx
    xor ax, ax
    ;asigno nums a ax
    mov al, num1 
    mov ah, num2
    ;contador
    mov bl, 0h
    RESTAR:
    sub al, num2 
    inc bl
    cmp al,num2
    jl IMPRIMIRRESTA
    jmp RESTAR
    

    IMPRIMIRRESTA:
    mov cociente, bl
    add cociente, 30h
    mov residuo, al
    add residuo, 30h
    mov dx, offset escociente
    mov ah, 09h
    int 21h
    xor ax,ax
    xor dx,dx
    
    mov dl, cociente
    xor ax, ax
    mov ah, 02h
    int 21h 
    
    xor dx, dx
    xor ax, ax
    mov dx, offset esresiduo
    mov ah, 09h
    int 21h
    xor ax,ax
    xor dx,dx
    
    mov dl, residuo
    xor ax, ax
    mov ah, 02h
    int 21h 
    ;fin del programa
   
    
    mov ah, 4ch
    int 21h
end programa