org 100h

.data
    test_str DB 'We are IUT students', 0Dh, 0Ah, '$'
.code
main proc
    ; Print the string
    mov ah, 9
    lea dx, test_str
    int 21h
    
    ; Count the number of characters
    mov si, 0                  
    mov dl, 0                  
    
count_loop:
    mov al, test_str[si]    
    cmp al, '$'                
    je end_counting            
    add dl, 1                     
    add si, 1                     
    jmp count_loop           

end_counting:
    hlt 
                   
        
main endp
end main
ret
          
          
          