.MODEL SMALL
.STACK 100H
.DATA
    ARRAY DB 1,2,3,4,5,6,7,8,9  ; Array of 9 elements (Byte array)
    
.CODE
NEWLINE MACRO
    MOV AH, 02h
    MOV DL, 10          ; Line feed (LF)
    INT 21H
    MOV DL, 13          ; Carriage return (CR)
    INT 21H
ENDM

MAIN PROC
    MOV AX, @DATA       ; Initialize DS
    MOV DS, AX
    
    MOV CX, 9           ; Set loop counter to 9
    MOV SI, 0           ; Start index at 0
    
L1:
    MOV AL, ARRAY[SI]   ; Load the byte from the array into AL
    ADD AL, 48          ; Convert the number to ASCII (adding 48)
    
    ; Print the ASCII character in AL
    MOV DL, AL          ; Move the ASCII character to DL for printing
    MOV AH, 02h         ; DOS function 02h to print character
    INT 21H             ; Call DOS interrupt to print
    
    MOV DL, ' '         ; Print space after number
    INT 21H
    
    INC SI              ; Move to the next element
    LOOP L1             ; Loop until CX reaches 0
    
    NEWLINE             ; Call the macro to print a newline
    
    MOV AX, 4C00h       ; Exit program
    INT 21H
    
MAIN ENDP
END MAIN
