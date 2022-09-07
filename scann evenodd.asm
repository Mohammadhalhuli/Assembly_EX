.model small
.stack 200
.DATA

        pri db 10,13,"pleaes enter your number:",'$'
        eror db 10,13,"not valid number",10,13,'$'
        no1 db 10,13,"this is odd",10,13,'$' 
        no2 db 10,13,"this is even",10,13,'$'
    
    
.CODE

    START:
      
      MOV AX ,@DATA
      MOV DS ,AX
     
      X1:
      mov ah ,09
      mov dx,offset pri
      int 21h
      mov ah ,01
      int 21h
      cmp al,'e'
      je toend 
      
      cmp al,30h
      JB eror
      cmp al,39h
      jb eror 
      
      test al ,1
      jz evn
     
      odd:
      mov dx,offste no1
      mov ah,9
      int 21h
      jmp x1
      
      evn:
      mov dx,offset no2
      mov ah,9
      int 21h
      jmp x1
      
      toend:
      MOV AX,4C00H
      INT 21H
    END START


     