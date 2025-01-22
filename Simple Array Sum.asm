.MODEL SMALL
.STACK 100H


.DATA
.CODE 
NEWLINE MACRO
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
ENDM

MAIN PROC
    MOV AH,1
    INT 21H 
    SUB AL, '0'  
    MOV BL, AL 
    MOV CX,0  
    
    NEWLINE
   
    L4: 
    MOV AH,1
    INT 21H
    MOV BH,AL 
    ADD CH,BH 
    SUB CH,48
  
    DEC BL
    CMP BL, 0
    JNZ L4  
    
    L6:
    NEWLINE 
    MOV AH,2
    MOV DL,CH 
    ADD DL,48
    INT 21H
    MAIN ENDP
END MAIN
