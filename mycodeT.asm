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
    MOV CL,AL
    
    
    
    MOV SI,0 
    NEWLINE
    
    L4:
    MOV AH,1
    INT 21H
    MOV CL,AL    
    
    MOV AH,1
    INT 21H
    MOV CH,AL
    
    CMP CL,CH
    JG L1
    JL L2 
    MOV AH,2
    MOV DL,'=' 
    JMP L3
    
    
    L1:
    MOV AH,2
    MOV DL,'>' 
    JMP L3  
     
    L2:
    MOV AH,2
    MOV DL,'<' 
    JMP L3 
    
    
    
    L3: 
    NEWLINE
    INC SI
    LOOP L4
    MAIN ENDP
END MAIN
   
    
    

