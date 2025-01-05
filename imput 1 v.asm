.MODEL SMALL
.STACK 100H
.CODE

main proc
    mov ah,1
    int 21h
    mov bl,al 
    
    mov ah,2
    mov dl,0AH
    INT 21H
    MOV DL,13
    INT 21H
    
    mov ah,2
    mov dl,bl
    int 21h
    
    main endp
end main

