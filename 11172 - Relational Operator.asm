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
    
    NEWLINE
   
    L4:
    MOV AH,1
    INT 21H
    MOV CL,AL    
    
    MOV AH,2
    MOV DL,' '
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV CH,AL  
    
    NEWLINE
    
    CMP CL,CH
    JG L1
    JL L2 
    MOV DL,'=' 
    JMP L3
    
    L1:
    MOV DL,'>' 
    JMP L3  
     
    L2:
    MOV DL,'<' 
    
    L3: 
    MOV AH,2
    INT 21H
    NEWLINE
    
    DEC BL
    CMP BL, 0
    JNZ L4  
    
    L6:
    MAIN ENDP
END MAIN
