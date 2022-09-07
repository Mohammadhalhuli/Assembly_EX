.model small
.stack 200
.DATA

       TEXT DB "THIS TEXT MUST BE",0
       FILENAME DB "input.txt",0
       HAN DB ?  
    
    
.CODE

    START:
      
      MOV AX ,@DATA
      MOV DS ,AX
      MOV DX,OFFSET FILENAME
      XOR CX,CX
      MOV AH,3CH
      INT 21H
      MOV DX,OFFSET FILENAME
      MOV AL,2
      MOV AH ,3DH
      INT 21H
      MOV HAN,AX
      MOV DX,OFFSET TEXT
      MOV BX ,HAN
      MOV CX,66
      MOV AH,40H
      INT 21H 
     
     
      MOV AX,4C00H
      INT 21H
    END START


     