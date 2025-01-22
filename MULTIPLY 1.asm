.MODEL
.STACK 100H
.DATA

.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AL,5
    MOV BL,2
    MUL BL
   
MAIN ENDP