ORG 0100h
.DATA
A DW 0FFFh
B DW 10h
C DW 260
D DW 225
E DW 210
F DW ?   
prompt DB 'Enter the value of n (0to9) ', 0Dh, 0Ah, '$'
ANS DW ?
.CODE
MAIN PROC      
    MOV AH, 9
    LEA DX, prompt
    INT 21h
    ;Taking an input
    XOR AL, AL
    MOV AH, 1
    INT 21h   
    MOV CL, 0
    MOV BL, 0
    SUB AL, 48

LOOP_1:
    CMP BL,AL
    JG  END_PROG
    ADD CL,BL
    ADD BL,1
    JMP LOOP_1
          
      
END_PROG:
    MAIN ENDP    
END MAIN
RET