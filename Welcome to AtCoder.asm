.model small
.stack 100h

.data
buffer DB 20, 0, 20 DUP(0)  

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
MOV AH,1
   INT 21H
   MOV BL,AL  
   
   NEWLINE
   MOV AH,1
   INT 21H
   MOV CL,AL
   
   MOV AH,2
   MOV DL,' '
   INT 21H
   
   MOV AH,1
   INT 21H
   MOV CH,AL 
   
   
   ADD BL,CL
   SUB BL,48
   ADD BL,CH
   SUB BL,48 
   
NEWLINE

MOV AH, 0AH
MOV DX, OFFSET buffer
INT 21H
   
NEWLINE
   
   MOV AH,2
   MOV DL,BL
   INT 21H 
   MOV DL,' '
   INT 21H
    
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
