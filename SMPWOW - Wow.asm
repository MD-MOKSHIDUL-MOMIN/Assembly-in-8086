.MODEL SMALL
.STACK 100H
.DATA 
A DW 'W$'
B DW 'o$'
C DW 'w$'
.CODE 
NEWLINE MACRO
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
ENDM

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,1
    INT 21H               
    SUB AL, '0'  
    MOV BL, AL 
    MOV CX,0  
    
    NEWLINE
    MOV AH,9
    LEA DX,A
    INT 21H
    L4: 
    MOV AH,9
    LEA DX,B
    INT 21H
  
    DEC BL
    CMP BL, 0
    JNZ L4  
    
    L6:
    MOV AH,9
    LEA DX,C
    INT 21H
    MAIN ENDP
END MAIN
