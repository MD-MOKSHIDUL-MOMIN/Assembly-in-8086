.MODEL SMALL
.STACK 100H
.DATA

.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AX,5
    MOV BX,2
    MUL BX
   
MAIN ENDP