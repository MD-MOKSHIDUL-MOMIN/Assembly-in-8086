.MODEL SMALL
.STACK 100H
.DATA
T DW 'ENTER THE SHAPE (CIRCLE=C OR RACTANGULAR=R): $'
C DW 'ENTER THE RADIOUS : $'
R DW 'ENTER THE LENTH AND WEIDE :$'
F DW 'THE AREA IS : $'
PI DW 31416
D DW 10000
CHO DB ?
L DB ?
W DB ?
A DW ? 

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
    
    MOV AH,9
    LEA DX,T
    INT 21H
    
    MOV AH,1  
    INT 21H
    MOV CHO,AL
    
    NEWLINE
    
    CMP CHO,'C'  
    JE circle  
    CMP CHO,'R'
    JE RECT
    
    JMP L1
    
    
    circle:
    MOV AH,09
    LEA DX,C
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    NEWLINE
    
    MOV AL,BL
    MUL AL
    MUL PI
    DIV D
    
    SUB AL,40 
    MOV CL,AL
    MOV BL,AH
    SUB BL,40
    
    MOV AH,9
    LEA DX,F
    INT 21H
    
    MOV AH,2
    MOV DL,CL 
    SUB DL,48
    INT 21H 
    
    MOV AH,2
    MOV DL,'.'
    INT 21H
              
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    
    RECT:
    
    
    L1:
    
    
    MAIN ENDP
END MAIN
    
    
    