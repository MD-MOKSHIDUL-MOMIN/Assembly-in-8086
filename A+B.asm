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
MOV BL,AL 

MOV AH,2
MOV DL,' '
INT  

MOV AH,1 
INT 21H
MOV BH,AL
ADD BL,BH 

NEWLINE  

MOV AH,2
MOV DL,BL
SUB DL,48
INT 21H
MAIN ENDP
END MAIN