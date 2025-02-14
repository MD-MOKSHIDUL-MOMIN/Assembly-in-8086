.MODEL SMALL
.STACK 100H
.DATA
N DW ?
.CODE

INP MACRO
     MOV N,0 
    MOV BL,10
    INPUT:
    MOV AH,1 
    INT 21H
    CMP AL,13
    JE NEXT
    SUB AL,30H
    MOV AH,0
    MOV CX,AX
    MOV AX,N
    MUL BL
    ADD AX,CX
    MOV N,AX
    JMP INPUT
    NEXT:
ENDM

OUTP MACRO
    MOV AX,N
    MOV DX,0
    MOV BX,10
    MOV CX,0
    
    L1:
    DIV BX
    
    PUSH DX
    MOV DX,0
    MOV AH,0
    INC CX
    CMP AX,0
    JNE L1
    
    MOV AH,2
    L2:
    POP DX
    ADD DX,48
    INT 21H
    LOOP L2
ENDM

NEWLINE MACRO
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
ENDM
    
MAIN PROC
    INP 
    NEWLINE
    
    OUTP
    
    MAIN ENDP
END MAIN