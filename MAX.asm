.model small
.stack 200
.DATA

     NO1 DB 83H
     NO2 DB 82H 
     
     MAX DB ?
    
    
.CODE

    START:
    
       
       MOV AX,@DATA
        MOV DS,AX
        
        MOV AL,NO1
       MOV BL,NO2
        CMP AL,BL
        JA X1 
        MOV MAX ,BL
        JMP X2
        
        X1:
            MOV MAX,AL
        
        X2:
        MOV AX,4C00H    


    END START


