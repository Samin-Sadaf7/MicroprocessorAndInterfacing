ORG 0100h
.DATA
A DW 0FFFh
B DW 10h
C DW 260
D DW 225
E DW 210 
input_string DB 'We are IUT Students', 0Dh, 0Ah, '$'
ans DW ?   
.CODE 
MAIN PROC
    MOV AH,9
    LEA DX, input_string 
    INT 21h
    
    XOR DL, DL                
    MOV SI, 0
    MOV DL, 0
    
COUNT:
    MOV AL, input_string[SI]
    CMP AL, '$'
    JE END_PROG
    ADD SI,1
    ADD DL,1
    JMP COUNT
    
END_PROG:
    ADD DL, '0'
    MOV AH,2
    INT 21h

MAIN ENDP
END MAIN
RET