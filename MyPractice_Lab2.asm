ORG 0100h
.DATA
A DW 0FFFh
B DW 10h
C DW 260
D DW 225
E DW 210
F DW ?   
prompt DB 'Input character ', 0Dh, 0Ah, '$'
ANS DW ?
.CODE
MAIN PROC      
    ;Giving the input prompt
    MOV AH, 9
    LEA DX, prompt
    INT 21h
    ;Take the input from keyboard 
    MOV AH, 1
    INT 21h       
    cmp AL, 97
    jge MAKE_GREATER
    ADD AL, 32 
    MOV BL, 0
    MOV CL, AL        
    
LOOP_1:
    CMP BL,5
    jge LOOP_2_init 
    ADD AL, 1
    CMP AL,123
    jge ROTATE_1

COME_BACK_1:
    ADD BL, 1
    MOV AH, 2 
    MOV DL, AL
    INT 21h        
    jmp LOOP_1     
    
LOOP_2_init:
    MOV BL, 0
    MOV AL, CL 
    JMP LOOP_2

LOOP_2:
    CMP BL, 5
    JGE LAST_LINE
    SUB AL, 1
    CMP AL, 96 
    JLE ROTATE_2
 
COME_BACK_2:
    ADD BL, 1
    MOV AH, 2
    MOV DL, AL
    INT 21h
    jmp LOOP_2
    
ROTATE_1:
    XOR AL, AL
    MOV AL, 97
    JMP COME_BACK_1      
             
ROTATE_2:
    XOR AL, AL
    MOV AL, 122
    JMP COME_BACK_2
    
MAKE_GREATER:
    SUB AL, 32    
    MOV BL, 0
    MOV CL, AL    
    
LOOP_3:
    CMP BL,5
    jge LOOP_4_init 
    ADD AL, 1
    CMP AL,91
    jge ROTATE_3

COME_BACK_3:
    ADD BL, 1
    MOV AH, 2 
    MOV DL, AL
    INT 21h        
    jmp LOOP_3     
    
LOOP_4_init:
    MOV BL, 0
    MOV AL, CL 
    JMP LOOP_4

LOOP_4:
    CMP BL, 5
    JGE LAST_LINE
    SUB AL, 1
    CMP AL, 64 
    JLE ROTATE_4
 
COME_BACK_4:
    ADD BL, 1
    MOV AH, 2
    MOV DL, AL
    INT 21h
    jmp LOOP_4
    
ROTATE_3:
    XOR AL, AL
    MOV AL, 65 
    JMP COME_BACK_3      
             
ROTATE_4:
    XOR AL, AL
    MOV AL, 90
    JMP COME_BACK_4
    
 
LAST_LINE:    
    MAIN ENDP
    
END MAIN
RET