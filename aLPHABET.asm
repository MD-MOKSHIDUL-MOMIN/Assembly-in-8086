.MODEL SMALL
.STACK 100H
.DATA
A DW 'alphabet $'   
B DW 'a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z $'
.CODE
MAIN PROC
MOV AX,@DATA
MOV DS,AX
MOV AH,9 
LEA DX,A
INT 21H 

MOV AH,2
MOV DL,10
INT 21H
MOV DL,13
INT 21H

MOV AH,9
LEA DX,B
INT 21H
MAIN ENDP
END MAIN