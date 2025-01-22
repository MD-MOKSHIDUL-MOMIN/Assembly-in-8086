.model small
.stack 100h

.data  
A DW 'Hello, World.$'
buffer DB 40, 0, 40 DUP(0)  

.code 
NEWLINE MACRO
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
ENDM
MOV AX, @data
MOV DS, AX 

MOV AH, 0AH
MOV DX, OFFSET buffer
INT 21H
   
NEWLINE
   
MOV AH,9
LEA DX,A
INT 21H
NEWLINE
    
MOV SI, OFFSET buffer + 2  

PrintLoop:
    MOV AL, [SI]          
    CMP AL, 0              
    JE DonePrinting        
    MOV DL, AL             
    MOV AH, 02H            
    INT 21H               
    INC SI                 
    JMP PrintLoop          

DonePrinting: 

MOV AH, 4Ch      
INT 21H
END
