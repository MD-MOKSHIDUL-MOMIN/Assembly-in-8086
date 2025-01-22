.MODEL SMALL
.STACK 100H
.DATA
A DW 'I Love you $' 
B DW ' times $' 
N DW ?
.CODE 
NEWLINE MACRO
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
ENDM


INP PROC
    MOV N, 0
    MOV BL, 10
INPUT:
    MOV AH, 1
    INT 21H
    CMP AL, 13           
    JE NEXT
    CMP AL, 32           
    JE NEXT
    SUB AL, 30H          
    MOV AH, 0
    MOV CX, AX
    MOV AX, N
    MUL BL               
    ADD AX, CX           
    MOV N, AX
    JMP INPUT
NEXT:
    RET
INP ENDP


PRINT PROC
    MOV AX, N
    MOV DX, 0
    MOV BX, 10
    MOV CX, 0

L1:
    DIV BX               
    PUSH DX              
    MOV DX, 0
    INC CX
    CMP AX, 0
    JNE L1

    MOV AH, 2
L2:
    POP DX
    ADD DX, 48           
    INT 21H
    LOOP L2             
    RET
PRINT ENDP

MAIN PROC
MOV AX,@DATA
MOV DS,AX 

CALL INP
 

NEWLINE


MOV AH,9 
LEA DX,A
INT 21H 

CALL PRINT

MOV AH,9 
LEA DX,B
INT 21H 

MAIN ENDP
END MAIN
