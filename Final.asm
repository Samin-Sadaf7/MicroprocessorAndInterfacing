.ORG 0100h
.DATA         
a DB 0


.CODE
MAIN PROC
              
    
  ;Taking input from user
    
    XOR SI, SI
    MOV SI, 0 
    
TAKE_INPUT:    
    CMP SI, 8
    JGE INPUT_FINISH
    MOV AH, 1
    INT 21h
    SUB AL, 30h
    MOV a[SI], AL
    ADD SI, 1
    JMP TAKE_INPUT

INPUT_FINISH: 
    XOR SI,SI 
    XOR CX, CX
    MOV SI,0
    MOV CX,0
    MOV BL, a[SI]
    
    CMP SI,0
    JE  JMP_0
REV_SORT:    
    MOV SI,CX   
    MOV DL, a[SI]   
    MOV a[SI],BL    
    MOV SI, AX
    MOV a[SI], DL
    MOV AH, 2
    MOV DL, BL
    ADD DL, 30h
    INT 21h
    INC CX
JMP_0:
    CMP CX, 8
    JGE END_PROG
    MOV SI,CX 
    MOV BL,a[SI]

FIND_BIG:
    INC SI
    CMP SI,8
    JGE REV_SORT 
    MOV DL, a[SI]
    CMP BL, DL
    JGE FIND_BIG
    MOV BL, DL     
    MOV AX, SI
    JMP FIND_BIG

 
END_PROG:        
    MAIN ENDP
END MAIN
RET