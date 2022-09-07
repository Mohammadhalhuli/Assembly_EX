; multi-segment executable file template.
.MODEL SMALL
.STACK 100
.data 
    
    NO1 DB 63H
    NO2 DB 2EH   
    ;NO3 DB 75H
    SUM DW ?  ;16BIT &* NOT INTIAL VALUS
    AVG DB ?  ;16BIT &* NOT INTIAL VALUS
    rem db ?
    msg1 db 10,13,10,13,10,13,"please enter the numbur",10,13,"$"
    msg2 db 10,13,"plase enter the number 2",10,13,"$"
    msg3 db 10,13,"sum is ",10,13,"$"
    msg4 db 10,13,"avg is ",10,13,"$"
    msg5 db 10,13,"rem is ",10,13,"$"    


code segment
start:
        
        print macro msg
            mov ah,9
            mov dx,offset msg
            int 21h
        endm
        
        MOV AX,@DATA
        MOV DS,AX
        
        
        xx1:
       PRINT MSG1
       MOV AH,1
       INT 21H
       MOV NO1,AL
        
        
        PRINT MSG2
        MOV AH,1
        INT 21H
        MOV NO2,AL
        MOV AX,0
        MOV AL,NO1
        MOV AL,NO2
        
        AAA ;ASCE AFTER ACETION
        
        
        
     
         MOV SUM ,AX
         MOV BL,2
         AAD
         DIV  BL
         MOV AVG,AL
         MOV REM,AH
         PRINT MSG3
         
         MOV DX,SUM
         ADD DH,30H
         MOV DL,DH
         MOV AH,2
         INT 21H
         MOV DX,SUM
         ADD DL,30H
         MOV AH,2
         INT 21H
         PRINT MSG4
         
         MOV DL,AVG
         ADD DL ,30H
         MOV AH,2
         INT 21H
         
         
         PRINT MSG5
         MOV DL,REM
         ADD DL ,30H
         MOV AH,2
         INT 21H
         JMP xx1
         
        
        
  
ends

end start ; set entry point and stop the assembler.
