.model small
.stack 200
.DATA

        NO1   DB 75H
        EVEN  DB 0
        ODD   DB 0
    
    
.CODE

    START:
      
      MOV AX ,@DATA
      MOV DS ,AX
     
     
      MOV AL ,NO1
      TEST AL,1
      JZ E1
      
     
     
     
     
     ; MOV AX,0
      ;MOV AL,NO1
     ; MOV BL,2
      
       
      ;TEST AH ,1
      ;JZ E1
      
      MOV EVEN ,0
      MOV ODD,1
      JMP X2
      
      E1:
      MOV EVEN,1
      MOV ODD,0
      
      X2:
      MOV AX,4C00H
      
      INT 21H

    END START


