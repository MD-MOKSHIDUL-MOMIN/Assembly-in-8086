.MODEL SMALL
.STACK 100H
.DATA
A DB "ENTER THE NUMBER: $"  
B DB 'ENTER THE NUMBER: $'

.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,A 
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    
    MOV AH,9
    LEA DX,B
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    
    
    
    MAIN ENDP
END MAIN
    