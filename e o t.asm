.MODEL SMALL
.STACK 100H

.DATA
    N DW 0                
    R DW ?           
    C DW 0                 
    
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
    MOV AX, @DATA
    MOV DS, AX            ; Initialize data segment

    CALL INP              

    MOV AX, N            
    MOV BX, 5             
    MOV C, AX            

    NEWLINE               

   
    MOV AX, C
    MOV DX, 0
    DIV BX
    MOV R,AX                
    CMP DX, 0            
    JNE L8                

    
    MOV AX,R 
    MOV N,AX
    
    CALL  PRINT
    JMP L9

L8:
    MOV AX,R
    INC AX 
    MOV N,AX
    
    CALL  PRINT

L9:
    NEWLINE              
    MOV AH, 4Ch           
    INT 21H
MAIN ENDP
END MAIN
