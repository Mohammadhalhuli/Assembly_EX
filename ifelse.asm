.model small
.stack 200
.DATA

        NO1     DB 75H
        NO2     DB 63H
        OPCODE  DB 2
        rus     db ?
    
.CODE

    START:          
    
                                ;IF opcode =0
                                ;no1 and  no2
                                ;else if opcode =1
                                ;no1 or no1
                                ;else if opcod =2
                                ;no1 xor no2
      MOV AX ,@DATA
      MOV DS ,AX
      
      
      mov al,no1
      mov bl,no2
     
      cmp opcode ,2
      jz xor1  
      
      
      cmp opcode,1
      jz or1 
       
      and opcode,1
      mov rus,al
      jmp x2
      
      or1:
      or al,bl 
      mov rus,al
      jmp x2
      
      xor1:
      xor al,bl
      mov rus,al
      jmp x2
      
      x2:
      mov ax,4c00h 
      INT 21H

    END START


