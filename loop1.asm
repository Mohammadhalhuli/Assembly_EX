.model small
.stack 200
.DATA

    string db "Hello",10,13,"$"
     string1 db "end",10,13,"$"
     s db "enter the charechter",10,13,"$"
    
.CODE

    START: 
         mov ax,@data
         mov ds,ax 
         
         mov cx,10
         x1:
         mov ah,2
         mov dl,'B'
         int 21h
         loop X1
         
            
                 MOV AX,4C00H    
                 int 21h
        
            
          
         ;mov ah,09
         ;mov dx,offset string 
         ;int 21h
         
         ;mov ah,09
         ;lea dx, string
         ;int 21h  
        
      
      
  

    END START


