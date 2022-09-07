.model small
.stack 200
.DATA

    resalte dw ?
    
    
.CODE

    START: 
    
        mult macro num1,num2
            mov bl,num1
            mov al,num2
            mul bl
            mov resalte ,ax
            
        endm
        
        mov ax,@data
        mov ds ,ax 
        ;macro functione
        mult 9,5 
        
        ;procure functione
        mov bl,9 
        call mul2 
        
        
        MOV AX,4C00H    
        int 21h
        
        mul2 proc near
            mov al,5
            mul bl
            ;mov bl,9
            mov resalte,ax
            ret
            mul2 Endp  

    END START


