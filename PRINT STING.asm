.MODEL SMALL
.STACK 100H
.DATA
A DB "MOMIN$"

.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,A
    INT 21H
    MAIN ENDP
END MAIN
    