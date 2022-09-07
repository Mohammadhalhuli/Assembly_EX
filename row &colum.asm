                                     ; multi-segment executable file template.
.MODEL SMALL
.STACK 100
.data 
     row db ?
     col db ?
     coloue db ?
     char db ?


.code
start:
  mov row,1
  
  mov col,1
  
  mov char,"M"
  mov coloue ,13
  
  mov bh,0
  mov ah,2
  mov dh,row
  mov dl,col
  int 10h
  
  mov al,char
  mov bl,coloue
  mov bh,1
  xor bh,bh
  mov ah,9
  mov cx,1
  int 10h
  
  
  xor bh,bh
  mov ah,2
  mov dh,row
  inc col
  mov dl,col
  int 10h
  
  mov char,"E"
  mov al,char
  inc coloue
  mov bl,coloue
  xor bh,bh
  mov ah,9
  mov cx,5
  int 10
  
  mov ax ,4c00h
  int 21h
  
        
        
        
  
ends

end start ; set entry point and stop the assembler.
