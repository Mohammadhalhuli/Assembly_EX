.model small
.stack 200
.DATA

     MS1 DB 10,13,"ORGA         ",10,13,"$"
     MS2 DB 10,13,"NO ORGA         ",10,13,"$"   
     DAY DB ?
     TIME DB ?
    
.CODE

    START:
        
        PRINT MACRO MS
            MOV AH,9
            MOV DX,OFFSET MS
            INT 21H
            ENDM
      MOV AX ,@DATA
      MOV DS ,AX
      
      ;MOV AH ,2AH
     ; INT 21H
     ; INT 3 
     
     MOV AH,2AH
     INT 21H
     MOV DAY ,AL
     MOV AH ,2CH
     INT 21H
     MOV TIME,CH
     TEST DAY ,1
     JZ NOLECTURE
     TEST AL ,00000100
     JNZ NOLECTURE
     PRINT MS1
     JMP TOEBD
      
      NOLECTURE:
      PRINT MS2
      TOEBD:MOV AX,4C00H
      INT 21H
    END START


     