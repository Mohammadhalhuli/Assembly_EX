; multi-segment executable file template.
.MODEL SMALL
.STACK 100
.data 
    
    NO1 DB 63H
    NO2 DB 2EH   
    NO3 DB 75H
    SUM DW ?  ;16BIT &* NOT INTIAL VALUS
    AVG DB ?  ;16BIT &* NOT INTIAL VALUS
        


code segment
start:
        
        MOV AX,@DATA
        MOV DS,AX
        MOV AX,0
        MOV AL,NO1 ;AL=NO1
        ADD AL,NO2 ;ADD  --> ((AL=NO1)+NO2)   -->= AL 
         
        ADC AH,00H ;ADD AND FLAGE 
        ADD AL ,NO3
        ADC AH,0
        MOV SUM ,AX
        MOV BL,3
        DIV BL
        MOV AVG ,AL
        
        MOV AX,4C00H
        INT 21H
        
        
        
  
ends

end start ; set entry point and stop the assembler.
