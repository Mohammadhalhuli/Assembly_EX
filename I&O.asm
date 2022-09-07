.model small
.stack 200
.DATA

    string db "Hello",10,13,"$"
     string1 db "end",10,13,"$"
     s db "enter the charechter",10,13,"$"
    
.CODE

    START: 
       ;  mov ax,@data
        ; mov ds,ax
             
               mov ax,seg string
            mov ds,ax
             
              
             mov ah,9
                mov dx ,offset s
                int 21h
                
          
            
           ; mov ah,01
           ;8  not show char scanner 
            mov ah,08
            int 21h
           
            cmp al,'a'
            je  sc
            
            
            fir:
                mov ah,9
                mov dx ,offset string
                int 21h
                jmp toend
          
            
            sc:  
            mov ah,9
            mov dx,offset string1
            int 21h
            
            
            toend:
                 MOV AX,4C00H    
                 int 21h
        
            
          
         ;mov ah,09
         ;mov dx,offset string 
         ;int 21h
         
         ;mov ah,09
         ;lea dx, string
         ;int 21h  
        
      
      
  

    END START


