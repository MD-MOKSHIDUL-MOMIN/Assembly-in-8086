.MODEL SMALL
.STACK 100H
.DATA
A DW ?        
B DW ?        
N DW ?
R DW ?
        
.CODE 

INP PROC
    MOV N, 0
    MOV BL, 10
INPUT:
    MOV AH, 1
    INT 21H
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

NEWLINE MACRO
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
ENDM

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX          

    CALL INP
    MOV BX, N 
    MOV R,BX          
    NEWLINE

L4:                    
    CALL INP
    MOV AX, N
    MOV A, AX           

    
    MOV AH, 2
    MOV DL, ' '
    INT 21H 
    
             

    CALL INP
    MOV AX, N
    MOV B, AX           

    NEWLINE
    MOV AX, A
    CMP AX, B           
    JG L1
    JL L2
    MOV DL, '='         
    JMP L3

L1:
    MOV DL, '>'         
    JMP L3

L2:
    MOV DL, '<'         

L3:
    MOV AH, 2
    INT 21H             
    NEWLINE

    DEC R             
    CMP R, 0
    JNZ L4              

L6:
    MOV AH, 4CH         
    INT 21H
MAIN ENDP
END MAIN
