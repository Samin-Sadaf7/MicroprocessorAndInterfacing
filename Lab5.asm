ORG 100h

.DATA
    MESSAGE DB 'Enter 5 decimal numbers(0~5): ','$'
    LARGEST_PROMPT DB 'The largest number entered is: $' 
    SMALLEST_PROMPT DB 'The smallest number entered is: $' 
    AVERAGE_PROMPT DB 'The average number entered is: $' 
    AVERAGE_TEST DB 'The sum is: $'
    
    NUM_LARGEST DB 0
    NUM_SMALLEST DB 9
    NUM_AVERAGE DB 0
    NUM_OF_NUMBERS DB 5
.CODE
MAIN PROC
    XOR CX, CX
    ADD CX, 5   
    XOR BH, BH
    ; Print the string
    MOV AH, 9
    LEA DX, MESSAGE
    INT 21h
    
    LOOP1:
        ; Input a number
        MOV AH,1
        INT 21h
        
        ; Input saved to AL..save in BL
        MOV BL, AL  
        SUB BL, 48
        CALL LARGEST ; Value saved to NUM_LARGEST 
        CALL SMALLEST; Value saved to NUM_SMALLEST
        CALL CALCULATE_AVERAGE ;Value saved to NUM_AVERAGE
     
    LOOP LOOP1
                     
                                            
    ; Print the largest number in the prompt message
    MOV AH, 09h
    LEA DX, LARGEST_PROMPT
    INT 21h

    MOV DL, NUM_LARGEST ; Load the largest number into DL
    ADD DL, 48         ; Convert decimal number to ASCII character
    MOV AH, 02h         ; DOS function to print character
    INT 21h 
    
    ; Print the smallest number in the prompt message
    MOV AH, 09h
    LEA DX, SMALLEST_PROMPT
    INT 21h

    MOV DL, NUM_SMALLEST 
    ADD DL, 48         
    MOV AH, 02h         
    INT 21h
    
    ; Print the average number in the prompt message
    MOV AH, 09h
    LEA DX, AVERAGE_PROMPT
    INT 21h

    MOV DL, NUM_AVERAGE 
    ADD DL, 48         
    MOV AH, 02h         
    INT 21h
                    
    HLT
MAIN ENDP    


LARGEST PROC
    CMP BL, NUM_LARGEST
    JLE LARG_LABEL
    MOV NUM_LARGEST, BL
    
LARG_LABEL:
    RET    
LARGEST ENDP

SMALLEST PROC
    CMP BL, NUM_SMALLEST
    JGE SMALL_LABEL
    MOV NUM_SMALLEST, BL 
SMALL_LABEL:
    RET
SMALLEST ENDP 

CALCULATE_AVERAGE PROC
    ADD BH, BL
    CMP CX, 1
    JNE AVG_LABEL
    XOR AX, AX
    MOV AL, BH
    MOV BH, 5
    DIV BH   ; Divide AX register with BH
    MOV BH, AL   
    MOV NUM_AVERAGE, BH
    RET
AVG_LABEL:
    RET
CALCULATE_AVERAGE ENDP

END MAIN
RET
