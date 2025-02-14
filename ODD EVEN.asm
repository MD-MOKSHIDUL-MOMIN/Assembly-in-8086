.MODEL SMALL
.STACK 100H


.DATA 
A DW 'YES $'
B DW 'NO $'
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
    
    
   
    L4:
    NEWLINE 
    MOV AH,1
    INT 21H
    MOV BH,2
    DIV BH
    CMP AH,0
    JE L1
    NEWLINE 
    MOV AH,9
    LEA DX,B
    INT 21H 
    JMP L7
    
    
    L1:  
    NEWLINE
    MOV AH,9
    LEA DX,A
    INT 21H
    L7:
    DEC BL
    CMP BL, 0
    JNZ L4  
    
    L6:
    NEWLINE 
    MAIN ENDP
END MAIN
