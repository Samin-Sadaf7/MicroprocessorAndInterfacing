org 100h
.data
    arr db 1, 2, 3, 4, 5, 6, 7, 8, 9 
    a db 00h
    prompt db 'input (the value of n in between 2 ~ 9): $'
    output db 'the result is: $'  
.code
main proc
    mov ax, @data
    mov ds, ax
    xor ax, ax 
  
    mov si, offset arr
    mov di, offset a
    mov dx, offset prompt
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    mov cl, al
    sub cl, 48
 
        
    loop_1:
        mov ax, [si]
        imul ax
        mov ah, 0
        add bx, ax
        add si, 1 
   
    loop loop_1 
    
    
main endp
end main
ret